
        <main class="flex-shrink-0">
           
            <!-- Start of Hero Section-->
            <header class="bg-dark py-5 ">
                <div class="container px-5">
                    <div class="row gx-5 align-items-center justify-content-center">
                        <div class="col-lg-8 col-xl-7 col-xxl-6">
                            <div class="my-5 text-center text-xl-start">
                                <!-- Headers and texts-->
                                <h1 class="display-5 fw-bolder text-white mb-2">{{this.hero_section_header}}</h1>
                                <p class="lead fw-normal text-white-50 mb-4">{{this.hero_section_description}}</p>
                                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">

                                    <!-- Customizable Buttons -->
                                    <a class="btn btn-primary btn-lg px-4 me-sm-3" href="{{this.hero_button_link_1}}">{{this.hero_button_text_1}}</a>
                                    <a class="btn btn-outline-light btn-lg px-4" href="{{this.hero_button_link_2}}">{{this.hero_button_text_2}}</a>

                                </div>
                            </div>
                        </div>
                            {{if {this.multi_images} }}
                        <!-- Start of Silder / Carousel-->
                        <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
                            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel"
                            >
                                <!-- Slider Images Iteration-->
                                <div class="carousel-inner">
                                    {{each media.{this.multi_images} as slide}}
                                            <!-- Iterates the images -->                                     
                                            <div class="carousel-item {{if {slide._num} == 1}}active {{end-if}} ">
                                                <img class="d-block w-100" height="300" width="100%" src="{{slide.image.getImage()}}"
                                                alt="{{slide.image.getImageTitle()}}"
                                                />
                                            </div>
                                    {{/each}}                 
                                </div>
                                <a class="carousel-control-prev" href="#carouselExampleControls"
                                role="button" data-bs-slide="prev"
                                >
                                <span
                                    class="carousel-control-prev-icon" aria-hidden="true"
                                ></span>
                                </a>
                                <a
                                class="carousel-control-next" href="#carouselExampleControls" role="button"
                                data-bs-slide="next"
                                >
                                <span
                                    class="carousel-control-next-icon" aria-hidden="true"
                                ></span>
                                </a>
                            </div>
                        </div>
                        {{else}}
                        
                        
                        {{/if }}
                    </div>
                </div>
            </header>
            
            <!-- Features section-->
            <section class="py-5" id="features">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5 mb-lg-0"><h2 class="fw-bolder mb-0">{{this.feature_header}}</h2></div>
                        <div class="col-lg-8">

                            <div class="row gx-5 row-cols-1 row-cols-md-2">
                              <!-- Iterating all Dynamic Feature Items including Icons, Titles, Text-->
                              <!-- Feature items can be modify from the model "Feature Items" under Module Business Model-->
                                {{each feature_item as feature sort by feature_sort}}
                                <div class="col mb-5 h-100">
                                   
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi {{feature.feature_icons}}"></i></div>
                                    <h2 class="h5">{{feature.feature_title}}</h2>
                                    <p class="mb-0">{{feature.feature_text}}</p>
                                </div>
                                {{/each}}
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Testimonial section-->
            <div class="py-5 bg-light">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-10 col-xl-7">
                            <div class="text-center">
                                <div class="fs-4 mb-4 fst-italic">{{this.testimonial_text}}</div>
                                <div class="d-flex align-items-center justify-content-center">
                                    <img class="rounded-circle me-3" src="https://0ksjtj3x.media.zestyio.com/CEO.png" alt="..." />
                                    <div class="fw-bold">
                                       {{this.testimonial_author}}
                                        <span class="fw-bold text-primary mx-1">/</span>
                                       {{this.author_job}}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <section class="py-5">
                <div class="container px-5 my-5">
                <!-- Blog preview section-->
             <!--   {{include module_modern_business_blog}} -->
                   
                    <!-- Call to action-->
                    <aside class="bg-primary bg-gradient rounded-3 p-4 p-sm-5 mt-5">
                        <div class="d-flex align-items-center justify-content-between flex-column flex-xl-row text-center text-xl-start">
                            <div class="mb-4 mb-xl-0">
                                <div class="fs-3 fw-bold text-white">{{this.call_to_action_header}}</div>
                                <div class="text-white-50">{{this.call_to_action_text}}</div>
                            </div>
                            <div class="ms-xl-4">
                                <section id="cta"> 
                                    {{if {post_var.email} }}  <!-- Checks if email is already sent -->
                                    <div class="input-group mb-2" >
                                    <!-- Will Display Thank you text once an email is already sent  -->
                                    <!-- The Thank you text content are editable from the model: "Module Modern Business-> Thank You Text "  -->
                                    <h3 class="fs-3 fw-bold text-white"> <i class="bi bi-check-circle"></i> {{this.thank_you_text}} </h3>
                                    </div>
                                    {{else}}
                                    <!-- Email form will be displayed if no email was sent yet-->
                                    <form action="#cta" class="input-group mb-2" method="POST" enctype="multipart/form-data">
                                        <!-- These values control how Zesty understands the form. -->
                                        <input name="zlf" value="Email Sign up" type="hidden">
                                        <input name="zcf" value="1" type="hidden"> 

                                        <!-- Information below will be recorder from Leads -->
                                        <input type="email" name="email" class="form-control" required placeholder="Email address..." aria-label="Email address..." aria-describedby="button-newsletter" />
                                        <input type="hidden" name="{{setting.contact-form.honeypot}}" value="">
                                        <!--
                                        Honeypot in the input field will help to detect bots in submitting forms automatically
                                        See here for more info about honeypot: https://zesty.org/tools/guides/how-to-prevent-bots-from-submitting-your-form#setting-up-the-honeypot
                                        -->
                                        <input type="submit" value="Sign up" class="btn btn-outline-light" id="button-newsletter">
                                    
                                    </form>
                                    
                                    
                                    {{end-if}}
                                </section>
                            </div>
                        </div>
                    </aside>
                </div>
            </section>
        </main>
        

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 