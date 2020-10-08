Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 724BB286F87
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Oct 2020 09:33:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19EFEC32EA8;
	Thu,  8 Oct 2020 07:33:42 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F849C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Oct 2020 07:33:40 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j2so5396541wrx.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 Oct 2020 00:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=tgWoS1DNrNMjeMErRF1VLwt6P/QpByafehH2pDshfP0=;
 b=ZsFHLmxE7BINX3sLNhZmok4EUe+DHyNsoKFxHXdX3XoSP/qHZ6sO4YdEVZnTldhdY7
 26iJvDlQBO5kneSJgq8Ui40Fv99Qfopg22haKLGa7CTGRmxvfG5orLelU4lG2qZiGElE
 dkoMO11L1XEeGCXndx2NoKnjCR9PDvPpU+7dELIvNgPtdPpnwhuLZKm4h4zdb6JXoeU2
 xxWCenu7xveYXeRW/fFuM7i4SAdQdP8Q2EPua1MW2787y1cWhN8CJkWCyic9+GFesKWz
 w+b0z7cnlPzn6cPtmqVDDXtZPtjWeZ8S+kbZJoZdAm8Cdr4W17C7OiYCPMJiNDQuM6GZ
 Y2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tgWoS1DNrNMjeMErRF1VLwt6P/QpByafehH2pDshfP0=;
 b=LYzcAfLYfCVa2EViWY4xy9kmYPbMG5bBgKzMQMCmEEBfZAWHvGjRZQ+gQo92n0ryAM
 d8f/V9LKLcqJgi5fuQUWLo2k0O/JLVS9rkfi6jcwBPLC7l3cVGpQZ0WZ6C52Np8pcm1t
 92d1RhREBrV8YyDr4TxvjWVJVmEr/BTKAaLqRCCgSuFHaJePpFrSZwxi3AQZXIAM7N+k
 jbVxgifESh7H+iGSq2Z0yj3eiu1iLidxzC9hf4W26wwzyWI8BSpiY9AQ1zr6Gq1yOdd7
 31+uZBGMVhzIM50Kupyi9MS3wHWN86x+AqFVCcc7zW4vbUVolqjD5F2ZecRYyTj4Uo6P
 7Zdw==
X-Gm-Message-State: AOAM532fPGCW5inATuyLH13YaV97qg6SGj2NdJsPxvK7gBnVkQl/Q+uN
 zW2G7as7bd859VjD0gHnhGUmwA==
X-Google-Smtp-Source: ABdhPJzabvtfwLmhnEYubgjfeo2bB0aroK/nU1F0zOHh2mrKpbUH4p2gKhjVT7qNDholk5mCIJP9Ag==
X-Received: by 2002:a5d:40c3:: with SMTP id b3mr8460241wrq.157.1602142419967; 
 Thu, 08 Oct 2020 00:33:39 -0700 (PDT)
Received: from dell ([91.110.221.232])
 by smtp.gmail.com with ESMTPSA id s11sm1385391wrm.56.2020.10.08.00.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 00:33:39 -0700 (PDT)
Date: Thu, 8 Oct 2020 08:33:37 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Pavel Machek <pavel@ucw.cz>
Message-ID: <20201008073337.GG1763265@dell>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-4-post@lespocky.de>
 <20201007100359.GC12224@duo.ucw.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201007100359.GC12224@duo.ucw.cz>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mips@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>,
 Alexander Dahl <post@lespocky.de>, Dan Murphy <dmurphy@ti.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v7 03/12] dt-bindings: mfd: Fix schema
 warnings for pwm-leds
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

T24gV2VkLCAwNyBPY3QgMjAyMCwgUGF2ZWwgTWFjaGVrIHdyb3RlOgoKPiBIaSEKPiAKPiA+IFRo
ZSBub2RlIG5hbWVzIGZvciBkZXZpY2VzIHVzaW5nIHRoZSBwd20tbGVkcyBkcml2ZXIgZm9sbG93
IGEgY2VydGFpbgo+ID4gbmFtaW5nIHNjaGVtZSAobm93KS4gIFBhcmVudCBub2RlIG5hbWUgaXMg
bm90IGVuZm9yY2VkLCBidXQgcmVjb21tZW5kZWQKPiA+IGJ5IERUIHByb2plY3QuCj4gPiAKPiA+
ICAgRFRDICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2lxczYyeC5l
eGFtcGxlLmR0LnlhbWwKPiA+ICAgQ0hFQ0sgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWZkL2lxczYyeC5leGFtcGxlLmR0LnlhbWwKPiA+IC9ob21lL2FsZXgvYnVpbGQvbGlu
dXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9pcXM2MnguZXhhbXBsZS5k
dC55YW1sOiBwd21sZWRzOiAncGFuZWwnIGRvZXMgbm90IG1hdGNoIGFueSBvZiB0aGUgcmVnZXhl
czogJ15sZWQoLVswLTlhLWZdKyk/JCcsICdwaW5jdHJsLVswLTldKycKPiA+ICAgICAgICAgRnJv
bSBzY2hlbWE6IC9ob21lL2FsZXgvc3JjL2xpbnV4L2xlZHMvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2xlZHMvbGVkcy1wd20ueWFtbAo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBB
bGV4YW5kZXIgRGFobCA8cG9zdEBsZXNwb2NreS5kZT4KPiAKPiBPa2F5LCBzbyBJIG5lZWQgUm9i
J3MgYWNrIGhlcmUsIEkgZ3Vlc3MuLi4gYW5kIHJlc3Qgb2YgdGhlIHNlcmllcyBpcwo+IG5vdCBy
ZWFsbHkgZm9yIG15IHRyZWUuCgpUaGlzIHBhdGNoIGlzIG5vdCBmb3IgeW91ciB0cmVlIGVpdGhl
ci4gOykKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0g
RGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZv
ciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
