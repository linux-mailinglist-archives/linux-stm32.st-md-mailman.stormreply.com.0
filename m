Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 202C71B97B8
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2020 08:49:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C02B6C36B0B;
	Mon, 27 Apr 2020 06:49:15 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DCF7C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Apr 2020 06:49:13 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id i10so19095306wrv.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Apr 2020 23:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=OIRTtsyYCkg1t+ohXCk6lMBH379NOlwqIHq+QRjBm7Y=;
 b=SvUvd1yxOiPnMe9YAUHgv8lQk0A2/6HHwopTOUCWs8NALsr8IaE+hEzfoKEo1yuqs2
 TjmUIlPobyTTQwgv36TEaJLcVdpJsaOogMMa4AuCDJpBCcsgiZU/DME2f/khPL6iHlIg
 EK+qQPX4JJRFUEvhskXLGcPGW04SF1toxWWM+RmxQ3XLi2BNb7WkSIEi+Hr6YfkXUGV9
 7r/ITt+NXy5qzPvRpN8Ht1AKkwLhwe14aeKCNyTT33vTINcvj7L/SRGzEV1yKIvqLi/8
 9pMTJn7ubL6lG8FAp4pE5t90T8NoZdw8q65UAq+7ypuxycxcTarTTWVpeWiyRhymWdH5
 vfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=OIRTtsyYCkg1t+ohXCk6lMBH379NOlwqIHq+QRjBm7Y=;
 b=drf90Gx173WqJ1dHw7DtuOB9aGTtSmE9dBtKMEeHehajtXeXNExjA7MArgwobQKf4y
 V6XFCRJRLNSQ2zktOUkWJ3wmEBU0QMJ6aszMtrAt4sEooN5aCdb1nLxOL25CZvzxZIww
 xjkNvOBK8pOrbJvswHzYDUiP7PE1moT6e5Yx7zcPcHsM+fPBHXSTH1EfznLej2fK8Cdp
 Bs1uug3mF12jBBEwJ0Ep5dwe8pX0k5FApbkcRxcMbzLhrOaei9Ba5uqN8tLTR6TEtqI9
 B3oPYFfDrUMKRJpkzx/UOkPVTotYsEzQgaifWa5sqB9rkGA3ez+OZlRXpHgX5AnJ1YP7
 IRvw==
X-Gm-Message-State: AGi0PuapExZBsWInGKI+dN8zzog4o920AfFAfClJ0jw9t47M1a8DyhH+
 o51KpFVhA+n+sNWXG4pOOGgICw==
X-Google-Smtp-Source: APiQypI8chzF5P4rL2qpeRVXfTfA1qmduiJM0OWyA6AOLxbJHzUHnF5rqPqCGyojl0yXIHmSI+roCA==
X-Received: by 2002:adf:f884:: with SMTP id u4mr25202217wrp.171.1587970153463; 
 Sun, 26 Apr 2020 23:49:13 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id z10sm20140795wrg.69.2020.04.26.23.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2020 23:49:12 -0700 (PDT)
Date: Mon, 27 Apr 2020 07:49:10 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Adrian Pop <pop.adrian61@gmail.com>
Message-ID: <20200427064910.GC3559@dell>
References: <20200424181642.32084-1-pop.adrian61@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200424181642.32084-1-pop.adrian61@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] arm: dt-bindings: mfd: stm32f-rcc:
 Add missing DSI clock
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

T24gRnJpLCAyNCBBcHIgMjAyMCwgQWRyaWFuIFBvcCB3cm90ZToKCj4gQWRkIG1pc3NpbmcgY2xv
Y2suCj4gCj4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIFBvcCA8cG9wLmFkcmlhbjYxQGdtYWlsLmNv
bT4KPiAtLS0KPiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9tZmQvc3RtMzJmNy1yY2MuaCB8IDEgKwo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCkkgYXNzdW1lIHBhdGNoIDIgZGVwZW5k
cyBvbiB0aGlzPwoKSWYgc28sIHdoZXJlIGlzIGl0PyAgV2h5IGlzbid0IGl0IGluIG15IGluYm94
PwoKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9tZmQvc3RtMzJmNy1yY2MuaCBi
L2luY2x1ZGUvZHQtYmluZGluZ3MvbWZkL3N0bTMyZjctcmNjLmgKPiBpbmRleCBhOTBmMzYxM2M1
ODQuLmJhNWNiNzQ1NmVlNCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2R0LWJpbmRpbmdzL21mZC9z
dG0zMmY3LXJjYy5oCj4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9tZmQvc3RtMzJmNy1yY2Mu
aAo+IEBAIC0xMDcsNiArMTA3LDcgQEAKPiAgI2RlZmluZSBTVE0zMkY3X1JDQ19BUEIyX1NBSTEJ
CTIyCj4gICNkZWZpbmUgU1RNMzJGN19SQ0NfQVBCMl9TQUkyCQkyMwo+ICAjZGVmaW5lIFNUTTMy
RjdfUkNDX0FQQjJfTFREQwkJMjYKPiArI2RlZmluZSBTVE0zMkY3X1JDQ19BUEIyX0RTSQkJMjcK
PiAgCj4gICNkZWZpbmUgU1RNMzJGN19BUEIyX1JFU0VUKGJpdCkJKFNUTTMyRjdfUkNDX0FQQjJf
IyNiaXQgKyAoMHgyNCAqIDgpKQo+ICAjZGVmaW5lIFNUTTMyRjdfQVBCMl9DTE9DSyhiaXQpCShT
VE0zMkY3X1JDQ19BUEIyXyMjYml0ICsgMHhBMCkKCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10K
TGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNl
IHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIg
fCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
