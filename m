Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F27372E75
	for <lists+linux-stm32@lfdr.de>; Tue,  4 May 2021 19:05:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B414FC59784;
	Tue,  4 May 2021 17:05:37 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9E9CC59781
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 May 2021 17:05:34 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id c17so8323008pfn.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 May 2021 10:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=+bVzPOaiGSpT9fPHodrAVpiteIe5e+Ae3qWhGcxKKAU=;
 b=kcQjh8UyCfHGDomwiT3CD9fJ4Uv6ynvJ7yVxBkSenSh8/4pBwX/ns1e1cqz5XvCt/J
 /X4r5KTma3914e56sEW0xfNH34HnbCTLcPEzZ9r7is5j1IwB1+pAPOPz5gZE99F7gCvA
 cmmJJlz3vPjEvTlna0gqbOGhjr6wyeKFP62zoJqbJ8weQppTiyYcolnZchUtGL8d2C3k
 0eSZ8sCHZHpI6ZSH5PnWrhBEPlvPaaQvYHF2rl8AORhX2pHVCzlOY9wpSdRX115Q262l
 vDWP34a0V73sWmZYN06/h8xDekYUalDNee9IxYJvQLy9a3OtYWkM12efk+irjATRNXQZ
 fGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+bVzPOaiGSpT9fPHodrAVpiteIe5e+Ae3qWhGcxKKAU=;
 b=fvMTd8hLAvieN9YXaIDhm/8hjIjCzLvsIYPjIzjhiXLNk2egFOqL9oPUlRDK2nwZSX
 qRkYwezZDDVdAlpTtYwfPxjq2Ksuh4gmTPUb4H/HUAKsXc0XEEIDNaRHPPTZFvqVeY3s
 cKZqCvS1MF91RXUUO1QzW0GYYc0ZU19sBNVfF/jIfW4eOIQR+GU6SuG2dYt7HkoSyyo8
 HeDCkeucOx3s9BMax9DARuMw1bA2K0zEokp/l2LalVEJszCO+shuPpTqH+ROzTA8d5or
 r42byO1TsqMimLXKrnvIpv6IrO0vR9wuOnhY1J/HFJfUlPDMquHgjv3cyYfwd5Px06ZU
 1nuQ==
X-Gm-Message-State: AOAM531KBkQz8h5yH9Xqa93zOQ5S6Oux3hEbkNzwr2SCpQRYG7WCQObs
 ORXW2zMNDE54RGl6OW0XUW/Izg==
X-Google-Smtp-Source: ABdhPJwrzlIkkQtOwdmep59o++iyB2NlituPGYpI1BN/yYBGd2NSCYsW91QD+1JkXKZU8+AcR+A8qQ==
X-Received: by 2002:a63:5c41:: with SMTP id n1mr2160215pgm.333.1620147933177; 
 Tue, 04 May 2021 10:05:33 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id x9sm13848080pfq.197.2021.05.04.10.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 10:05:32 -0700 (PDT)
Date: Tue, 4 May 2021 11:05:30 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <20210504170530.GD1734971@xps15>
References: <20210429080639.6379-1-arnaud.pouliquen@foss.st.com>
 <20210503174238.GD1699665@xps15>
 <b2f6b9ca-9dc2-920b-941d-175779bc1034@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b2f6b9ca-9dc2-920b-941d-175779bc1034@foss.st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] rpmsg: char: Remove useless includes
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

SGkgQXJuYXVkLAoKWy4uLl0KCj4gCj4gSSBzdGFydGVkIGJ5IHRoaXMgb25lIGFuZCB0aGVuIEkg
Z290IGNhcnJpZWQgYXdheSB0ZXN0ZWQgdGhlIG90aGVyIGluY2x1ZGUuLi4KPiBZb3UgYXJlIHJp
Z2h0LCBJIGp1c3QgZG9uJ3QgZm9sbG93IGhlciB0aGUgZmlyc3QgcnVsZSBvZiB0aGUgInN1Ym1p
dCBjaGVja2xpc3QiCj4gCj4gIklmIHlvdSB1c2UgYSBmYWNpbGl0eSB0aGVuICNpbmNsdWRlIHRo
ZSBmaWxlIHRoYXQgZGVmaW5lcy9kZWNsYXJlcyB0aGF0Cj4gZmFjaWxpdHkuIERvbuKAmXQgZGVw
ZW5kIG9uIG90aGVyIGhlYWRlciBmaWxlcyBwdWxsaW5nIGluIG9uZXMgdGhhdCB5b3UgdXNlLiIK
PiAKPiBUaGF0IHNhaWQgSSBqdXN0IGhhdmUgYSBkb3VidCBmb3IgdWFwaS9saW51eC9ycG1zZy5o
IHRoYXQgd2lsbCBiZSBpbmNsdWRlCj4gYnkgcnBtc2cuaFsyXSwgYXMgdGhlc2UgaW5jbHVkZXMg
YXJlIHBhcnQgb2YgdGhlIHJwbXNnIGZyYW1ld29yayBBUEksIHNob3VsZCB3ZQo+IGtlZXAgYm90
aCwgY29uc2lkZXJpbmcgdGhlIHJ1bGUgYXMgc3RyaWN0PwoKSSByZWQgdGhlIGxhc3QgcGFyYWdy
YXBoIHNldmVyYWwgdGltZXMgSSBjYW4ndCB1bmRlcnN0YW5kIHdoYXQgeW91IGFyZQp0cnlpbmcg
dG8gY29udmV5LiAgUGxlYXNlIHJlcGhyYXNlLCBwcm92aWRlIG1vcmUgY29udGV4dCBvciBkZXRh
aWwgZXhhY3RseSB3aGVyZQp5b3UgdGhpbmsgd2UgaGF2ZSBhIHByb2JsZW0uCgpUaGFua3MsCk1h
dGhpZXUKCgo+IAo+IFsxXSBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9w
cm9jZXNzL3N1Ym1pdC1jaGVja2xpc3QuaHRtbAo+IFsyXQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvcHJvamVjdC9saW51eC1yZW1vdGVwcm9jL3BhdGNoLzIwMjEwMzExMTQwNDEzLjMx
NzI1LTMtYXJuYXVkLnBvdWxpcXVlbkBmb3NzLnN0LmNvbS8KPiAKPiBUaGFua3MsCj4gQXJuYXVk
Cj4gCj4gPiAKPiA+IFRoYW5rcywKPiA+IE1hdGhpZXUKPiA+IAo+ID4+ICAKPiA+PiAgI2RlZmlu
ZSBSUE1TR19ERVZfTUFYCShNSU5PUk1BU0sgKyAxKQo+ID4+ICAKPiA+PiAtLSAKPiA+PiAyLjE3
LjEKPiA+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
