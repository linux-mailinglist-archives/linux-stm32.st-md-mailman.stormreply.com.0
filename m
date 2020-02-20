Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC82165EF0
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Feb 2020 14:37:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79E9AC36B0B;
	Thu, 20 Feb 2020 13:37:17 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46FE2C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Feb 2020 13:37:14 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p17so2079010wma.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Feb 2020 05:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=B4PLo7ULnoL8yyxNbBuvmhizTKdxVbJiDyyciEc36Lc=;
 b=qRt7DBLZBTVQjM1tmi4ELDLZ8ufVlBTbCqFqtzgJ9BHN030AEdAoh3uAIzOzj+XaUd
 qGcHTGaeJ7u4Pl392ptxOLZvSLUN/rNczq8f87EnApfyE1oEpsNf6NjIsXHqF5fGolJt
 QkIOU219N8LG8XCiKD7oZMb9rtkxOVG3H8u73O9Su5KwaQHYtYxU+uwx5d1PfHUk9kc5
 dy02FIlFosCGGi/uUmJmptrHNTYXjJqRw/xpzmM/yU0dNMmX7r9ys4t1FYLo2qQGTxo7
 lvREku+RWOMk7LtwEikUgSNvEUKxKzpKZdJ6jhDJXqKFqIdOkdeDSou4B6vHcWhVnOf8
 9tPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=B4PLo7ULnoL8yyxNbBuvmhizTKdxVbJiDyyciEc36Lc=;
 b=K9dBqda8WOCBFV1YOHcd1Ri2SJbJMXoquUJyd/JCuTUv8bQWxV+rzbKA3EMnMxw2vi
 iOZzm0ssN8nxRjehS28xEHIBH3xyIiprYzqrXF205yxYy91ItA3lKgV0ysbs1I6fWzjA
 BkC21voF+U8Z3EejO2y1tJjDbMU68Cw1Sa6SZqvAygxVElSCuz/KL6KZfYu6I4ImZAn7
 oRRr8fr1mdYbT3LC4y6GR4V6gIj3ztpilUZPxBwsEWfy3m5L28r1N9gKFc0rBzlSDlp3
 sPkztgGCARvqagNkqq+LiwGgOTwcc2xJfSAnuZFd4ylOEj1jA4i0qdo1+jX7UhCSZYnH
 jfhA==
X-Gm-Message-State: APjAAAVpyCsjpeD2AyxHs+PcVOCSgyrRjXy7WBHfszJVOzyWXt/eBtYs
 miEZXxh8d6wpNfaH5PFE9kRJ7A==
X-Google-Smtp-Source: APXvYqxeEECe1zPsmH3M53hHGcqRTpW593ckp3/6EuRcU0KckGtsaWYA5KUQiu8gYOO5hhf+lwdcPg==
X-Received: by 2002:a05:600c:2c44:: with SMTP id
 r4mr4567137wmg.140.1582205833995; 
 Thu, 20 Feb 2020 05:37:13 -0800 (PST)
Received: from dell (89-145-231-170.xdsl.murphx.net. [89.145.231.170])
 by smtp.gmail.com with ESMTPSA id u14sm4551648wrm.51.2020.02.20.05.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 05:37:13 -0800 (PST)
Date: Thu, 20 Feb 2020 13:37:39 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <20200220133739.GG3494@dell>
References: <20200217134546.14562-1-benjamin.gaignard@st.com>
 <20200217134546.14562-3-benjamin.gaignard@st.com>
 <e9f7eaac-5b61-1662-2ae1-924d126e6a97@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e9f7eaac-5b61-1662-2ae1-924d126e6a97@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 tglx@linutronix.de, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 2/3] mfd: stm32: Add defines to be used
 for clkevent purpose
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gVGh1LCAyMCBGZWIgMjAyMCwgRGFuaWVsIExlemNhbm8gd3JvdGU6Cgo+IAo+IEhpIExlZSwK
PiAKPiBPbiAxNy8wMi8yMDIwIDE0OjQ1LCBCZW5qYW1pbiBHYWlnbmFyZCB3cm90ZToKPiA+IEFk
ZCBkZWZpbmVzIHRvIGJlIGFibGUgdG8gZW5hYmxlL2NsZWFyIGlycSBhbmQgY29uZmlndXJlIG9u
ZSBzaG90IG1vZGUuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEJlbmphbWluIEdhaWduYXJkIDxi
ZW5qYW1pbi5nYWlnbmFyZEBzdC5jb20+Cj4gCj4gQXJlIHlvdSBmaW5lIGlmIEkgcGljayB0aGlz
IHBhdGNoIHdpdGggdGhlIHNlcmllcz8KCkFja2VkLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0Bs
aW5hcm8ub3JnPgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVj
aG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBT
b0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
