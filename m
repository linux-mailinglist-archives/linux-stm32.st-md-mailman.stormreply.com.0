Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE13255862
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Aug 2020 12:10:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35280C32EA6;
	Fri, 28 Aug 2020 10:10:17 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF0D8C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 10:10:15 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y3so764879wrl.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 03:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=bSq5SvyGuEAR7HTW9EkWirck6/mt4ja6XuqM9i2UtcE=;
 b=uUfsV9bX2g2WLFAJal0RrTio5GD0tveUiqEms18A2TFDdY2TayD39/bho6lbBwpEO9
 7OhSIBrYLpMUP/NGPk9jIdS+L6KSJ+iO7HtzJ9m6eNnxrBLQEf//Rzlw5dwJKRBieFFY
 Ro8Niwh+WjPJdFnsWeMkvHdejo+IKspyDCvmNVSkXT93DDFOwncnTuHfl6F+JxvHBVhw
 Ky6wX3T9eIbgxGEdk/t1FPEWfknnZG20Tl/p4r2VeGauWC4IPUNHZDZZma8zwN2xpXLS
 ORhVOduYIDi4qSfzGTMLJw1f9KxEVYCds40B8cT6R+aIMu8jrMtkJp3BX1fz5LyGMUc/
 fiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bSq5SvyGuEAR7HTW9EkWirck6/mt4ja6XuqM9i2UtcE=;
 b=o7EsBk1kI3k1gwhmA0nBa5X5Y2YpSDpJJEZv6qD1nDrkDqdphaKmMdIkhS0J2lGTOR
 9yQuakGSKWK5RRkf6zEgu4CHrct0gMrxiGUE3e6wsRbaa2h9otBgN7K94w728B7ujo4B
 QYxadgkiprUd4+90y2b7uRNAEniYnCK0PHixkScP2ZuMER6ca03TCiS0kONQRNK1Ll9c
 qAd24K7IDy8fPxyvbg3H8cQE0bUGZYW5Up1Mxw6ycw700vkf1gWZgXxZG0KXbORHLUYn
 LA4fPGUDYo+Qj7psEJH1Pu+TMLKe0Lcz4aT231NFa76VgIcyA8d0/FRXBs5CzoWFoxft
 mf3w==
X-Gm-Message-State: AOAM532ZuCEAQ2C3yNt7u9dpMYTWvqEEwlHcg2SozLRrsgy6hNDd0dZf
 WwiCjZiqJlOGUGwp6r57SzIC+g==
X-Google-Smtp-Source: ABdhPJyHZPvqQFcx1P7uiUjZgyKst3EX44RhRKQqLGhsYGi70Dj6nTfb9BsJHrslejUACrbZt03uug==
X-Received: by 2002:a05:6000:1082:: with SMTP id
 y2mr821224wrw.222.1598609415296; 
 Fri, 28 Aug 2020 03:10:15 -0700 (PDT)
Received: from dell ([91.110.221.141])
 by smtp.gmail.com with ESMTPSA id i4sm1197625wrw.26.2020.08.28.03.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 03:10:14 -0700 (PDT)
Date: Fri, 28 Aug 2020 11:10:13 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20200828101013.GI1826686@dell>
References: <20200826144935.10067-1-krzk@kernel.org>
 <20200826144935.10067-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826144935.10067-2-krzk@kernel.org>
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/3] mfd: stmfx: Simplify with
	dev_err_probe()
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

T24gV2VkLCAyNiBBdWcgMjAyMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKCj4gQ29tbW9u
IHBhdHRlcm4gb2YgaGFuZGxpbmcgZGVmZXJyZWQgcHJvYmUgY2FuIGJlIHNpbXBsaWZpZWQgd2l0
aAo+IGRldl9lcnJfcHJvYmUoKS4gIExlc3MgY29kZSBhbmQgYWxzbyBpdCBwcmludHMgdGhlIGVy
cm9yIHZhbHVlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtA
a2VybmVsLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9tZmQvc3RtZnguYyB8IDggKysrLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCkFwcGxpZWQs
IHRoYW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFk
IC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJl
IGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
