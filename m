Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEE13B167D
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jun 2021 11:09:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E40B5C597B6;
	Wed, 23 Jun 2021 09:09:17 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69422C597B4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jun 2021 08:57:47 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id hc16so2775946ejc.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jun 2021 01:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Z6Z3rnoFwy3s+OnHi/sH1rvXTGduUYkOOkAbeaIPw4Q=;
 b=tdK9uAJWdmT+cTqTX4ozHwlgRi7wW7OUcIGpx+5Br2fodFNa+MnfUQZVAzgz1DMfXp
 n/6yy9sAzllko9mIwsv87gD1kCOH5+UvzuTO8Ov4YmQvbrKg9vhNxEnX9Bb3xpiNP2fH
 k9Oyze3A8ShMVN/bVHL82sBkwKgirt++Dw9dhx7H9AShjZynKsDqAx3QjkNyy+S3seYa
 O7aOzg7Mj0Cm2KxHYiHvi5dJSHR99JkBwPvAeetXr4PIjVliCzIaKYRVlGsyYaoAOytV
 AXOwIKzGUy2+Qw0GsQqKp2vE+Hbxv9yib/h1U+C6vqKY5DAWNhTnHvHGn5ed0S9mxQ6J
 iM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Z6Z3rnoFwy3s+OnHi/sH1rvXTGduUYkOOkAbeaIPw4Q=;
 b=fpozJ/eZuHOQOFDwxxWS8qp+PTxfV/RmryP+cNylJuWZQE6qMseaPd9/W0C/Ur27IH
 ES+4nJl4PRZYHpASw/A14Z4SjlEFRTWiIAj4DVDD58j8Oi6dkU9VTEo5sA7hvMEcH/ir
 ZdADpWivpmQK4rQVm7aLSm0au81rb9Doj2BtuPocXKn+TpDb7VVBIsmItZq+5gUnXI5Q
 Nlc+vP+lS0TZT4+9zJ1DKqsUubzGoHrxMS/kqNxc8ZV77E6HSNWwi/c46C0Q7RsMYXQj
 AC77XEjX/pLxDmLlo1/WI4GkyeWejJxW/xe9fDGF1RyeXhaDWqW7LVtHm+Ln7hWqe02E
 b4Hg==
X-Gm-Message-State: AOAM530d6OLJOFNeO2w2lgpL9zUXatBNoogizNIKXR4iK7xjHycYqH7w
 XfGsl1d8okwTlxwEt9lRXYpDWQZo53IZHllj4kJuSA==
X-Google-Smtp-Source: ABdhPJwy+pM9oZ1iyRoxUOJy65b7IRacVpAEIpAEHz2ud7J2MhpMBy54g7b0sAw4obchFDygfdWC6jUFii9npycxr4w=
X-Received: by 2002:a17:906:ca4a:: with SMTP id
 jx10mr8892678ejb.200.1624438666647; 
 Wed, 23 Jun 2021 01:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200902150643.14839-1-krzk@kernel.org>
 <20200902150643.14839-2-krzk@kernel.org>
In-Reply-To: <20200902150643.14839-2-krzk@kernel.org>
From: Michal Simek <monstr@monstr.eu>
Date: Wed, 23 Jun 2021 10:57:35 +0200
Message-ID: <CAHTX3dK+M9eg+Xod9tYHiEXY_igjO6iocaO=e1Frqd1kzPKTrw@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Wolfram Sang <wsa@the-dreams.de>
X-Mailman-Approved-At: Wed, 23 Jun 2021 09:09:16 +0000
Cc: Heiko Stuebner <heiko@sntech.de>, Sekhar Nori <nsekhar@ti.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, linux-i2c@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-rockchip@lists.infradead.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 bcm-kernel-feedback-list@broadcom.com, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-rpi-kernel@lists.infradead.org,
 linux-arm <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, LKML <linux-kernel@vger.kernel.org>,
 Oleksij Rempel <linux@rempel-privat.de>, Wolfram Sang <wsa@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Peter Rosin <peda@axentia.se>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [Linux-stm32] [PATCH 2/9] i2c: xiic: Simplify with
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

c3QgMi4gOS4gMjAyMCB2IDE3OjEwIG9kZXPDrWxhdGVsIEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4gbmFwc2FsOgo+Cj4gQ29tbW9uIHBhdHRlcm4gb2YgaGFuZGxpbmcgZGVm
ZXJyZWQgcHJvYmUgY2FuIGJlIHNpbXBsaWZpZWQgd2l0aAo+IGRldl9lcnJfcHJvYmUoKS4gIExl
c3MgY29kZSBhbmQgdGhlIGVycm9yIHZhbHVlIGdldHMgcHJpbnRlZC4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KPiAtLS0KPiAgZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy14aWljLmMgfCA5ICsrKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMteGlpYy5jIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy14aWljLmMKPiBp
bmRleCA5MGMxYzM2MjM5NGQuLmE5NzQzOGYzNWM1ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2ky
Yy9idXNzZXMvaTJjLXhpaWMuYwo+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMteGlpYy5j
Cj4gQEAgLTc4NywxMSArNzg3LDEwIEBAIHN0YXRpYyBpbnQgeGlpY19pMmNfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgICAgICAgIGluaXRfd2FpdHF1ZXVlX2hlYWQoJmky
Yy0+d2FpdCk7Cj4KPiAgICAgICAgIGkyYy0+Y2xrID0gZGV2bV9jbGtfZ2V0KCZwZGV2LT5kZXYs
IE5VTEwpOwo+IC0gICAgICAgaWYgKElTX0VSUihpMmMtPmNsaykpIHsKPiAtICAgICAgICAgICAg
ICAgaWYgKFBUUl9FUlIoaTJjLT5jbGspICE9IC1FUFJPQkVfREVGRVIpCj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgZGV2X2VycigmcGRldi0+ZGV2LCAiaW5wdXQgY2xvY2sgbm90IGZvdW5kLlxu
Iik7Cj4gLSAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGkyYy0+Y2xrKTsKPiAtICAgICAg
IH0KPiArICAgICAgIGlmIChJU19FUlIoaTJjLT5jbGspKQo+ICsgICAgICAgICAgICAgICByZXR1
cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCBQVFJfRVJSKGkyYy0+Y2xrKSwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImlucHV0IGNsb2NrIG5vdCBmb3VuZC5cbiIp
Owo+ICsKPiAgICAgICAgIHJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShpMmMtPmNsayk7Cj4gICAg
ICAgICBpZiAocmV0KSB7Cj4gICAgICAgICAgICAgICAgIGRldl9lcnIoJnBkZXYtPmRldiwgIlVu
YWJsZSB0byBlbmFibGUgY2xvY2suXG4iKTsKPiAtLQo+IDIuMTcuMQo+Cj4KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LWFybS1rZXJuZWwg
bWFpbGluZyBsaXN0Cj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVs
CgpJIHNlZSB0aGF0IHRoaXMgZGlkbid0IGdvIHRocm91Z2guCkFja2VkLWJ5OiBNaWNoYWwgU2lt
ZWsgPG1pY2hhbC5zaW1la0B4aWxpbnguY29tPgoKV29sZnJhbTogQ2FuIHlvdSBwbGVhc2UgYXBw
bHk/CgpUaGFua3MsCk1pY2hhbAoKCi0tIApNaWNoYWwgU2ltZWssIEluZy4gKE0uRW5nKSwgT3Bl
blBHUCAtPiBLZXlJRDogRkUzRDFGOTEKdzogd3d3Lm1vbnN0ci5ldSBwOiArNDItMC03MjE4NDI4
NTQKTWFpbnRhaW5lciBvZiBMaW51eCBrZXJuZWwgLSBYaWxpbnggTWljcm9ibGF6ZQpNYWludGFp
bmVyIG9mIExpbnV4IGtlcm5lbCAtIFhpbGlueCBaeW5xIEFSTSBhbmQgWnlucU1QIEFSTTY0IFNv
Q3MKVS1Cb290IGN1c3RvZGlhbiAtIFhpbGlueCBNaWNyb2JsYXplL1p5bnEvWnlucU1QL1ZlcnNh
bCBTb0NzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
