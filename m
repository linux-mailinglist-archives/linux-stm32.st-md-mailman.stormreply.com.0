Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B280ACEBF6
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Jun 2025 10:33:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6ED8C32EB0;
	Thu,  5 Jun 2025 08:33:02 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BEDEC349C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jun 2025 17:48:50 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-231e98e46c0so53965235ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Jun 2025 10:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1748972929; x=1749577729;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AZQvVO8nyC+ZKLyjCrtVBxSwB/yFvzMpPXbPJR/HF0A=;
 b=Ofq49ir4sukEp+K98oU7AE0Q0PGINaMXsYbjy8y6L0CCD9Cp0gqca6qmI9Pt+T40U9
 De1RKhGFecFktsvZ983uaNeJ3GsmdQbGTERJKY9j87hrpSxRRr7KZJjZrYbH1j7jPtRv
 bNGclTz7X3uR22oIdUMqKXKlpe6ne1y+zVlj5L9IH6BEMXL7e9nqQJUGJlGJPg/iVTgU
 wbAlZA282BJBdUXMSDKy9I5fqxbOYZieYU5+rBj1IWJiDvSUgyBWFMp/yQ+CWpQ9MhC1
 bJ3bh/hqDqEqJ7cTYRXC7CRUyjiGXvEQ7z9+Nm/6sf3PrdzbHiROX7pV1gTqo7PyGKG+
 FIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748972929; x=1749577729;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AZQvVO8nyC+ZKLyjCrtVBxSwB/yFvzMpPXbPJR/HF0A=;
 b=V8BVN6+Z8rDlwgSS3BjHI0c7qn4jxnQrcm3+GOr0RJd0TbLzL6v1hbjnUjgxJ4okmm
 HpoD/oUvSK0KtL6qpk6lQciW0hqhdHcWSDVYwSBxJxfp3blitdar8cIGI6F8sXIOoN2H
 4+hXro09xHJjaHca1QWpnxFbxmANKYq01jA38TAN06Dm0HHSuqvXcpq+fIDsWA5nadKZ
 A4P+PiJas60xMNXwQsUQ9leUvdKFRQOLhsQRZ22MIsNvLcuDo8n5Bh2uYIdj6dezMJdp
 BmfilzCyXuLbp8ejuGduFAe+qfD0/AEN2vqlyMxhucpqXSJ/KO+YypbMbTIB/hgAfM82
 BBJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpXx5ssFvBCovzfedNByD0e6zEj7Hk5dHmAdStmC+R9NLVqUmcHPxRdg1Qh5BReTd/lTZZ/b/cl/BCmQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxB3YwY1nNrrxpqSiJF1UUwUyin8KR+6VGkCoXjPe51aG/kRzGS
 LedFFOKJdn5fuRpmA2LHnusqYcufq97GpMMePqQzOHuklk8tf4+gOUWTv6IaEH6k/g==
X-Gm-Gg: ASbGnctsTO4MDwLpYAxp7UW2eT4chAqS/Bp6iWJJ1KNe2kwadlKQaaEIORQVLN+BiIS
 8P6G90ny7lSLUiiwBJiMZt6BQ2pdJ+JQZOIQc3YUs8TSzmXzKh24ZTbzu8qXRCEGFPYkOUCqrpr
 9MySoDZ8VEfsrVSm5iyJVl7pgkXTj5TLiHQq2uWUVsHq5f/WghzY1cZAfASSv6OuxaZVrpx8ZtS
 oDdPOfBBlTu1Y+cb3/0xiZfXWJETO/EyWnkhh2T37j7Q10HicZwdhUpxgmtbphQr+QocbUJlFsl
 5jFbz13LkCgUnM/UGJTjgRqyjibOo4hIiS5RPeyP0XOwQtINKiuzYimPmL9v8mvx33ITlkvQvGz
 Hdso7gLNNI8FwCd3klzO3M3PiOQA=
X-Google-Smtp-Source: AGHT+IFw/hM9KjB2+YIvlfPv7TCR6YjgHHZTSPyy4qbS7jSH9/Uc2dPgZocX8nOAauHg/zfpx7Iegw==
X-Received: by 2002:a17:903:234f:b0:234:98eb:8eda with SMTP id
 d9443c01a7336-2355f762d1amr220323805ad.28.1748972928721; 
 Tue, 03 Jun 2025 10:48:48 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com.
 [34.83.65.128]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23506bc95fcsm89801555ad.11.2025.06.03.10.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 10:48:48 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:48:44 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <aD81fLvQQOBd7cot@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-2-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-2-daniel.lezcano@linaro.org>
X-Mailman-Approved-At: Thu, 05 Jun 2025 08:33:01 +0000
Cc: Nam Cao <namcao@linutronix.de>, Marco Elver <elver@google.com>,
 Saravan Kanna <saravanak@google.com>, Samuel Holland <samuel@sholland.org>,
 Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>,
 John Stulz <jstultz@google.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-tegra@vger.kernel.org, tglx@linutronix.de, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 1/7] clocksource/drivers/scx200: Add
	module owner
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 06/02/2025, Daniel Lezcano wrote:
> The conversion to modules requires a correct handling of the module
> refcount in order to prevent to unload it if it is in use. That is
> especially true with the clockevents where there is no function to
> unregister them.
> 
> The core time framework correctly handles the module refcount with the
> different clocksource and clockevents if the module owner is set.
> 
> Add the module owner to make sure the core framework will prevent
> stupid things happening when the driver will be converted into a
> module.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  drivers/clocksource/scx200_hrt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clocksource/scx200_hrt.c b/drivers/clocksource/scx200_hrt.c
> index c3536fffbe9a..5a99801a1657 100644
> --- a/drivers/clocksource/scx200_hrt.c
> +++ b/drivers/clocksource/scx200_hrt.c
> @@ -52,6 +52,7 @@ static struct clocksource cs_hrt = {
>  	.mask		= CLOCKSOURCE_MASK(32),
>  	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
>  	/* mult, shift are set based on mhz27 flag */
> +	.owner		= THIS_MODULE,
>  };
>  
>  static int __init init_hrt_clocksource(void)
> -- 
> 2.43.0
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
