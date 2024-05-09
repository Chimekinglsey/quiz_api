import '../styles/Error404.css'


export default function Error404(){
    return (
        <>
        <div class="exceptionContainer">
            <div class="container animate__animated animate__fadeIn">
                <h1 class="animate__animated animate__bounce">404</h1>
                <h2 class="animate__animated animate__fadeInUp">Oops! Page not found</h2>
                <p class="animate__animated animate__fadeInUp">Sorry, the page you are looking for might have been removed or is temporarily unavailable.</p>
                <h4 class="animate__animated animate__fadeInUp"><a onclick="window.history.back()">Back</a></h4>
            </div>
        </div>
        </>
    )
}