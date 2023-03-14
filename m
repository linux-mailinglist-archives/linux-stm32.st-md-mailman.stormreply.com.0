Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 729DD6B9F67
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Mar 2023 20:14:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24FE8C6904A;
	Tue, 14 Mar 2023 19:14:54 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B34FAC64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 19:14:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 331D2B81B60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 19:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 225A8C433A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 19:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678821290;
 bh=/o++2orgkh0eYVR24mG2HNDYYvTQagQPn7YxqtJRIGM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HOI98Pw9VCCF8s+F6gT0/O1R6qRkVaDVxGLQ8shxkdNBfBdydmcUvFW6EQfLc7YM0
 vmBilZVquc485LrVfceEBDtZ5LybBi3iYyZJu5Atg66iC/jClxnCI2aezJYdFFoATb
 zNO4ffMMmIujIN8SSLwFySmlQoHxUQvvxe7gYff9gAP/mw3Qg4H2W8KnmPzBqFmV95
 G4EAy1yl9InhDz5pDcACZQnS0w4q+XWfFxqzwmWoan2fay6DQ7ZJw+WU+KfGEmfVb6
 j4wRetXsbLov1/7Zp70w8um2hZFbKP7zYGebUQ5xbc0+mXL+JgIwQSiCO2mSEkyh8Z
 nDFNqyakCiYkA==
Received: by mail-vs1-f54.google.com with SMTP id e19so8676003vsu.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 12:14:50 -0700 (PDT)
X-Gm-Message-State: AO0yUKXgfaGYo4WjEv888YeloIv4s7cj7qB0c9Z/dmj/uhHuWZDoBJSL
 RyO5FUvhAT27aCDHpG6hqg//r18TPrh2prbiUw==
X-Google-Smtp-Source: AK7set+w7Dteu6Gz2fQIttAdFvbMZqpID4AHKHx68t3xQwsHx6BtKsv/C7yfYxJySG1yjFVS7BCS5PCUX/PHC6Xr3l0=
X-Received: by 2002:a67:b142:0:b0:41b:dc0c:a668 with SMTP id
 z2-20020a67b142000000b0041bdc0ca668mr25692104vsl.7.1678821289005; Tue, 14 Mar
 2023 12:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230310144718.1544169-1-robh@kernel.org>
 <ZAxrBtNdou28yPPB@corigine.com>
In-Reply-To: <ZAxrBtNdou28yPPB@corigine.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 14 Mar 2023 14:14:37 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJTsgmdwZZTfcMRnqaUfCNbgjO2mshxtAQK-qwoFqwCyw@mail.gmail.com>
Message-ID: <CAL_JsqJTsgmdwZZTfcMRnqaUfCNbgjO2mshxtAQK-qwoFqwCyw@mail.gmail.com>
To: Simon Horman <simon.horman@corigine.com>
Cc: linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Zhao Qiang <qiang.zhao@nxp.com>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>,
 Francois Romieu <romieu@fr.zoreil.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>,
 Wolfgang Grandegger <wg@grandegger.com>, devicetree@vger.kernel.org,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org,
 linux-can@vger.kernel.org, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Wei Fang <wei.fang@nxp.com>,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH] net: Use of_property_read_bool() for
	boolean properties
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

T24gU2F0LCBNYXIgMTEsIDIwMjMgYXQgNTo1MOKAr0FNIFNpbW9uIEhvcm1hbiA8c2ltb24uaG9y
bWFuQGNvcmlnaW5lLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIE1hciAxMCwgMjAyMyBhdCAwODo0
NzoxNkFNIC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+IEl0IGlzIHByZWZlcnJlZCB0byB1
c2UgdHlwZWQgcHJvcGVydHkgYWNjZXNzIGZ1bmN0aW9ucyAoaS5lLgo+ID4gb2ZfcHJvcGVydHlf
cmVhZF88dHlwZT4gZnVuY3Rpb25zKSByYXRoZXIgdGhhbiBsb3ctbGV2ZWwKPiA+IG9mX2dldF9w
cm9wZXJ0eS9vZl9maW5kX3Byb3BlcnR5IGZ1bmN0aW9ucyBmb3IgcmVhZGluZyBwcm9wZXJ0aWVz
Lgo+ID4gQ29udmVydCByZWFkaW5nIGJvb2xlYW4gcHJvcGVydGllcyB0byB0byBvZl9wcm9wZXJ0
eV9yZWFkX2Jvb2woKS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPgo+Cj4gUmV2aWV3ZWQtYnk6IFNpbW9uIEhvcm1hbiA8c2ltb24uaG9ybWFuQGNv
cmlnaW5lLmNvbT4KPgo+IC4uLgo+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvdmlhL3ZpYS12ZWxvY2l0eS5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvdmlhL3ZpYS12ZWxv
Y2l0eS5jCj4gPiBpbmRleCBhNTAyODEyYWM0MTguLjg2Zjc4NDNiNDU5MSAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3ZpYS92aWEtdmVsb2NpdHkuYwo+ID4gKysrIGIvZHJp
dmVycy9uZXQvZXRoZXJuZXQvdmlhL3ZpYS12ZWxvY2l0eS5jCj4gPiBAQCAtMjcwOSw4ICsyNzA5
LDcgQEAgc3RhdGljIGludCB2ZWxvY2l0eV9nZXRfcGxhdGZvcm1faW5mbyhzdHJ1Y3QgdmVsb2Np
dHlfaW5mbyAqdnB0cikKPiA+ICAgICAgIHN0cnVjdCByZXNvdXJjZSByZXM7Cj4gPiAgICAgICBp
bnQgcmV0Owo+ID4KPiA+IC0gICAgIGlmIChvZl9nZXRfcHJvcGVydHkodnB0ci0+ZGV2LT5vZl9u
b2RlLCAibm8tZWVwcm9tIiwgTlVMTCkpCj4gPiAtICAgICAgICAgICAgIHZwdHItPm5vX2VlcHJv
bSA9IDE7Cj4gPiArICAgICB2cHRyLT5ub19lZXByb20gPSBvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wo
dnB0ci0+ZGV2LT5vZl9ub2RlLCAibm8tZWVwcm9tIik7Cj4KPiBBcyBwZXIgbXkgY29tbWVudCBv
biAiW1BBVENIXSBuZmM6IG1ydmw6IFVzZSBvZl9wcm9wZXJ0eV9yZWFkX2Jvb2woKSBmb3IKPiBi
b29sZWFuIHByb3BlcnRpZXMiLgo+Cj4gSSdtIG5vdCB0aGF0IGVudGh1c2lhc3RpYyBhYm91dCBh
c3NpZ25pbmcgYSBib29sIHZhbHVlIHRvIGEgZmllbGQKPiB3aXRoIGFuIGludGVnZXIgdHlwZS4g
QnV0IHRoYXQgaXMgbGlrZWx5IGEgdG9waWMgZm9yIGFub3RoZXIgcGF0Y2guCj4KPiA+ICAgICAg
IHJldCA9IG9mX2FkZHJlc3NfdG9fcmVzb3VyY2UodnB0ci0+ZGV2LT5vZl9ub2RlLCAwLCAmcmVz
KTsKPiA+ICAgICAgIGlmIChyZXQpIHsKPgo+IC4uLgo+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9uZXQvd2FuL2ZzbF91Y2NfaGRsYy5jIGIvZHJpdmVycy9uZXQvd2FuL2ZzbF91Y2NfaGRsYy5j
Cj4gPiBpbmRleCAxYzUzYjU1NDY5MjcuLjQ3YzJhZDdhM2U0MiAxMDA2NDQKPiA+IC0tLSBhL2Ry
aXZlcnMvbmV0L3dhbi9mc2xfdWNjX2hkbGMuYwo+ID4gKysrIGIvZHJpdmVycy9uZXQvd2FuL2Zz
bF91Y2NfaGRsYy5jCj4gPiBAQCAtMTE3NywxNCArMTE3Nyw5IEBAIHN0YXRpYyBpbnQgdWNjX2hk
bGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ICAgICAgIHVoZGxjX3By
aXYtPmRldiA9ICZwZGV2LT5kZXY7Cj4gPiAgICAgICB1aGRsY19wcml2LT51dF9pbmZvID0gdXRf
aW5mbzsKPiA+Cj4gPiAtICAgICBpZiAob2ZfZ2V0X3Byb3BlcnR5KG5wLCAiZnNsLHRkbS1pbnRl
cmZhY2UiLCBOVUxMKSkKPiA+IC0gICAgICAgICAgICAgdWhkbGNfcHJpdi0+dHNhID0gMTsKPiA+
IC0KPiA+IC0gICAgIGlmIChvZl9nZXRfcHJvcGVydHkobnAsICJmc2wsdWNjLWludGVybmFsLWxv
b3BiYWNrIiwgTlVMTCkpCj4gPiAtICAgICAgICAgICAgIHVoZGxjX3ByaXYtPmxvb3BiYWNrID0g
MTsKPiA+IC0KPiA+IC0gICAgIGlmIChvZl9nZXRfcHJvcGVydHkobnAsICJmc2wsaGRsYy1idXMi
LCBOVUxMKSkKPiA+IC0gICAgICAgICAgICAgdWhkbGNfcHJpdi0+aGRsY19idXMgPSAxOwo+ID4g
KyAgICAgdWhkbGNfcHJpdi0+dHNhID0gb2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAiZnNsLHRk
bS1pbnRlcmZhY2UiKTsKPgo+IEhlcmUgdG9vLgoKVGhlc2UgYXJlIGFscmVhZHkgYm9vbC4gVHVy
bnMgb3V0IHRoZSBvbmx5IG9uZSB0aGF0IG5lZWRzIGNoYW5naW5nIGlzCm5vX2VlcHJvbS4gbmV0
ZGV2IGZvbGtzIG1hcmtlZCB0aGlzIGFzIGNoYW5nZXMgcmVxdWVzdGVkLCBzbyBJJ2xsIGFkZAp0
aGF0IGluIHYyLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
