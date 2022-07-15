Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E94BB575FE9
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Jul 2022 13:21:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86067C0D2BF;
	Fri, 15 Jul 2022 11:21:25 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30877C03FEA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jul 2022 11:21:24 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id b21so379766qte.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jul 2022 04:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :content-transfer-encoding:user-agent:mime-version;
 bh=7aAwPpbyNhMgBtXYplVX7e+e1ZXjzCZEFZQ0/Qp+rZs=;
 b=XdinAxILUx5V4/TMUwVnHjrF2YH64IZZFeCyINRd3Uc2T7zK5jdlBkPARxgAUQPknQ
 jCfx0227x6mZ/nJvyEdEOP0X2HcETQpjzcvpoVctcPe8hpu24084l6+Zfq6C9Yp+Pe19
 LGKjBB+xZcEbyihQC5Jva22iuE9RvoR1T1A0aT5gZbbl2uX8Yfn+4VkAcRNJ2oRqIyBp
 hvqhsHzhzq2ZXGWh4u48/NdYzataIRkzPk7S3WkMEcPz42YtmZsCcrQ4fU8zYMkCmEb3
 CBLLe2wOl7idYi+SWFz4xCdXZ1vxsiFpcZo/yuvmbHWMT7smdxKunQKgJNVUdlfCfqdO
 L3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=7aAwPpbyNhMgBtXYplVX7e+e1ZXjzCZEFZQ0/Qp+rZs=;
 b=Q0D9qiHn/pYQnLn0MRdGOf2hHwH+Oy+BrF7HV0SJRKpsBV9K5Up55A/OwqKqgIGwIE
 XoAP2Rxt+1cNDz10gXW8n5b9k+LmUA4MpO0E9HIJGX3RJ7truh/ezE9o+gwobc3aFirK
 iY72ZgMZCgIanFVnsYjHtMQD0eoahmUe8I8pLgSVDQBFethP2sePXnoSxIC7gl1CDJ/L
 OUwC+stQrCJUDiH3cadpt1PrSVAtVg8JpSf8ZWoRvrgRMhVagWdMkinVKmP7Z/d4ExE7
 j+57VtxdNPld/w5KS5ZZ57ChA9IlhX3o910WhUFAUWYnpUFFoBU8EbM4SPGlx+md1JaJ
 I76g==
X-Gm-Message-State: AJIora8X0uIoFTgP6Ie3GghM9OnSkNQVlANfrkA9JZvA5eFwNsGesay7
 +y6Gp+9MwbHodDOOTRQkDMM=
X-Google-Smtp-Source: AGRyM1uAV6CcmfwBUiFodYja+YAI93swdvRkjmOrj/G87DJHG1tvUago8AS2lP01zuUI+2pKWO0gZQ==
X-Received: by 2002:a05:622a:20f:b0:31e:de95:3cd3 with SMTP id
 b15-20020a05622a020f00b0031ede953cd3mr944896qtx.458.1657884082996; 
 Fri, 15 Jul 2022 04:21:22 -0700 (PDT)
Received: from p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de
 (p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de.
 [2003:f6:ef03:6f00:5de6:a4d0:d791:ed01])
 by smtp.gmail.com with ESMTPSA id
 ay7-20020a05620a178700b006b578ff5dfasm3767112qkb.41.2022.07.15.04.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jul 2022 04:21:22 -0700 (PDT)
Message-ID: <83d816f52b3d4194b51b20f31b875055f63cd718.camel@gmail.com>
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, linux-arm-msm@vger.kernel.org,
 openbmc@lists.ozlabs.org,  linux-renesas-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org,  linux-imx@nxp.com,
 linux-mips@vger.kernel.org, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-iio@vger.kernel.org, 
 chrome-platform@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com
Date: Fri, 15 Jul 2022 13:22:18 +0200
In-Reply-To: <c4385216-1d9e-34b3-58ea-edf8d9ed4cd8@foss.st.com>
References: <20220711123835.811358-1-nuno.sa@analog.com>
 <20220711123835.811358-14-nuno.sa@analog.com>
 <f0f150cf-586f-9f13-81b0-cb95bd0d8f23@foss.st.com>
 <ca7dc3801e29ddaa59f868c20d491d15541522d8.camel@gmail.com>
 <c4385216-1d9e-34b3-58ea-edf8d9ed4cd8@foss.st.com>
User-Agent: Evolution 3.44.3 
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 Fabio Estevam <festevam@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Benjamin Fair <benjaminfair@google.com>,
 Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>,
 Nancy Yuen <yuenn@google.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Cai Huoqing <cai.huoqing@linux.dev>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Gwendal Grignou <gwendal@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thara Gopinath <thara.gopinath@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 13/15] iio: adc: stm32-adc: convert to
 device properties
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

T24gV2VkLCAyMDIyLTA3LTEzIGF0IDE3OjQ4ICswMjAwLCBGYWJyaWNlIEdhc25pZXIgd3JvdGU6
Cj4gT24gNy8xMi8yMiAxMjozMywgTnVubyBTw6Egd3JvdGU6Cj4gPiBIaSBGYWJyaWNlLAo+ID4g
Cj4gPiBOaWNlIHRoYXQgc29tZW9uZSBpbiBTVCBpcyBsb29raW5nIGF0IHRoaXMgb25lIDopCj4g
Cj4gSGkgTnVubywKPiAKPiBUaGFuayB5b3UgZm9yIHRha2luZyBjYXJlIG9mIGNvbnZlcnRpbmcg
YWxsIHRoZXNlIGRyaXZlcnMgdG8gZGV2aWNlCj4gcHJvcGVydGllcywgaW5jbHVkaW5nIHRoaXMg
b25lIDotKS4KPiAKPiA+IAo+ID4gT24gTW9uLCAyMDIyLTA3LTExIGF0IDE2OjA0ICswMjAwLCBG
YWJyaWNlIEdhc25pZXIgd3JvdGU6Cj4gPiA+IE9uIDcvMTEvMjIgMTQ6MzgsIE51bm8gU8OhIHdy
b3RlOgo+ID4gPiA+IE1ha2UgdGhlIGNvbnZlcnNpb24gdG8gZmlybXdhcmUgYWdub3N0aWMgZGV2
aWNlIHByb3BlcnRpZXMuIEFzCj4gPiA+ID4gcGFydAo+ID4gPiA+IG9mCj4gPiA+ID4gdGhlIGNv
bnZlcnNpb24gdGhlIElJTyBpbmtlcm4gaW50ZXJmYWNlICdvZl94bGF0ZSgpJyBpcyBhbHNvCj4g
PiA+ID4gY29udmVydGVkIHRvCj4gPiA+ID4gJ2Z3bm9kZV94bGF0ZSgpJy4gVGhlIGdvYWwgaXMg
dG8gY29tcGxldGVseSBkcm9wICdvZl94bGF0ZScgYW5kCj4gPiA+ID4gaGVuY2UgT0YKPiA+ID4g
PiBkZXBlbmRlbmNpZXMgZnJvbSBJSU8uCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTog
TnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiDCoGRyaXZl
cnMvaWlvL2FkYy9zdG0zMi1hZGMuYyB8IDEyMSArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
Cj4gPiA+ID4gLS0tLQo+ID4gPiA+IC0tLS0KPiA+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA2NyBp
bnNlcnRpb25zKCspLCA1NCBkZWxldGlvbnMoLSkKPiA+ID4gPiAKPiA+ID4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9paW8vYWRjL3N0bTMyLWFkYy5jCj4gPiA+ID4gYi9kcml2ZXJzL2lpby9hZGMv
c3RtMzItCj4gPiA+ID4gYWRjLmMKPiA+ID4gPiBpbmRleCAzOTg1ZmU5NzI4OTIuLmU1NTg1OTEx
M2RmOCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2lpby9hZGMvc3RtMzItYWRjLmMKPiA+
ID4gPiArKysgYi9kcml2ZXJzL2lpby9hZGMvc3RtMzItYWRjLmMKPiA+ID4gPiBAQCAtMjEsMTEg
KzIxLDExIEBACj4gPiA+ID4gwqAjaW5jbHVkZSA8bGludXgvaW8uaD4KPiA+ID4gPiDCoCNpbmNs
dWRlIDxsaW51eC9pb3BvbGwuaD4KPiA+ID4gPiDCoCNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4K
PiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L21vZF9kZXZpY2V0YWJsZS5oPgo+ID4gPiA+IMKgI2lu
Y2x1ZGUgPGxpbnV4L252bWVtLWNvbnN1bWVyLmg+Cj4gPiA+ID4gwqAjaW5jbHVkZSA8bGludXgv
cGxhdGZvcm1fZGV2aWNlLmg+Cj4gPiA+ID4gwqAjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5o
Pgo+ID4gPiA+IC0jaW5jbHVkZSA8bGludXgvb2YuaD4KPiA+ID4gPiAtI2luY2x1ZGUgPGxpbnV4
L29mX2RldmljZS5oPgo+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvcHJvcGVydHkuaD4KPiA+ID4g
PiDCoAo+ID4gPiA+IMKgI2luY2x1ZGUgInN0bTMyLWFkYy1jb3JlLmgiCj4gPiA+ID4gwqAKPiA+
ID4gPiBAQCAtMTUzMCw4ICsxNTMwLDggQEAgc3RhdGljIGludAo+ID4gPiA+IHN0bTMyX2FkY191
cGRhdGVfc2Nhbl9tb2RlKHN0cnVjdAo+ID4gPiA+IGlpb19kZXYgKmluZGlvX2RldiwKPiA+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsKPiA+ID4gPiDCoH0KPiA+ID4gPiDCoAo+ID4g
PiA+IC1zdGF0aWMgaW50IHN0bTMyX2FkY19vZl94bGF0ZShzdHJ1Y3QgaWlvX2RldiAqaW5kaW9f
ZGV2LAo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3Qgb2ZfcGhhbmRsZV9hcmdzCj4gPiA+ID4gKmlpb3Nw
ZWMpCj4gPiA+ID4gK3N0YXRpYyBpbnQgc3RtMzJfYWRjX2Z3bm9kZV94bGF0ZShzdHJ1Y3QgaWlv
X2RldiAqaW5kaW9fZGV2LAo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdAo+ID4gPiA+IGZ3
bm9kZV9yZWZlcmVuY2VfYXJncyAqaWlvc3BlYykKPiA+ID4gPiDCoHsKPiA+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgaW50IGk7Cj4gPiA+ID4gwqAKPiA+ID4gPiBAQCAtMTU4NSw3ICsxNTg1LDcgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBpaW9faW5mbwo+ID4gPiA+IHN0bTMyX2FkY19paW9faW5mbyA9
IHsKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgLmh3Zmlmb19zZXRfd2F0ZXJtYXJrID0gc3RtMzJf
YWRjX3NldF93YXRlcm1hcmssCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoC51cGRhdGVfc2Nhbl9t
b2RlID0gc3RtMzJfYWRjX3VwZGF0ZV9zY2FuX21vZGUsCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oC5kZWJ1Z2ZzX3JlZ19hY2Nlc3MgPSBzdG0zMl9hZGNfZGVidWdmc19yZWdfYWNjZXNzLAo+ID4g
PiA+IC3CoMKgwqDCoMKgwqDCoC5vZl94bGF0ZSA9IHN0bTMyX2FkY19vZl94bGF0ZSwKPiA+ID4g
PiArwqDCoMKgwqDCoMKgwqAuZndub2RlX3hsYXRlID0gc3RtMzJfYWRjX2Z3bm9kZV94bGF0ZSwK
PiA+ID4gPiDCoH07Cj4gPiA+ID4gwqAKPiA+ID4gPiDCoHN0YXRpYyB1bnNpZ25lZCBpbnQgc3Rt
MzJfYWRjX2RtYV9yZXNpZHVlKHN0cnVjdCBzdG0zMl9hZGMKPiA+ID4gPiAqYWRjKQo+ID4gPiA+
IEBAIC0xNzgyLDE0ICsxNzgyLDE0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QKPiA+ID4gPiBpaW9f
Y2hhbl9zcGVjX2V4dF9pbmZvCj4gPiA+ID4gc3RtMzJfYWRjX2V4dF9pbmZvW10gPSB7Cj4gPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoHt9LAo+ID4gPiA+IMKgfTsKPiA+ID4gPiDCoAo+ID4gPiA+IC1z
dGF0aWMgaW50IHN0bTMyX2FkY19vZl9nZXRfcmVzb2x1dGlvbihzdHJ1Y3QgaWlvX2Rldgo+ID4g
PiA+ICppbmRpb19kZXYpCj4gPiA+ID4gK3N0YXRpYyBpbnQgc3RtMzJfYWRjX2Z3X2dldF9yZXNv
bHV0aW9uKHN0cnVjdCBpaW9fZGV2Cj4gPiA+ID4gKmluZGlvX2RldikKPiA+ID4gPiDCoHsKPiA+
ID4gPiAtwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBpbmRpb19kZXYt
PmRldi5vZl9ub2RlOwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBkZXZpY2UgKmRldiA9
ICZpbmRpb19kZXYtPmRldjsKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHN0bTMyX2Fk
YyAqYWRjID0gaWlvX3ByaXYoaW5kaW9fZGV2KTsKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgdW5z
aWduZWQgaW50IGk7Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHUzMiByZXM7Cj4gPiA+ID4gwqAK
PiA+ID4gPiAtwqDCoMKgwqDCoMKgwqBpZiAob2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgImFz
c2lnbmVkLXJlc29sdXRpb24tCj4gPiA+ID4gYml0cyIsCj4gPiA+ID4gJnJlcykpCj4gPiA+ID4g
K8KgwqDCoMKgwqDCoMKgaWYgKGRldmljZV9wcm9wZXJ0eV9yZWFkX3UzMihkZXYsICJhc3NpZ25l
ZC1yZXNvbHV0aW9uLQo+ID4gPiA+IGJpdHMiLCAmcmVzKSkKPiA+ID4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHJlcyA9IGFkYy0+Y2ZnLT5hZGNfaW5mby0+cmVzb2x1dGlvbnNb
MF07Cj4gPiA+ID4gwqAKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgZm9yIChpID0gMDsgaSA8IGFk
Yy0+Y2ZnLT5hZGNfaW5mby0+bnVtX3JlczsgaSsrKQo+ID4gPiA+IEBAIC0xODczLDExICsxODcz
LDExIEBAIHN0YXRpYyB2b2lkCj4gPiA+ID4gc3RtMzJfYWRjX2NoYW5faW5pdF9vbmUoc3RydWN0
Cj4gPiA+ID4gaWlvX2RldiAqaW5kaW9fZGV2LAo+ID4gPiA+IMKgCj4gPiA+ID4gwqBzdGF0aWMg
aW50IHN0bTMyX2FkY19nZXRfbGVnYWN5X2NoYW5fY291bnQoc3RydWN0IGlpb19kZXYKPiA+ID4g
PiAqaW5kaW9fZGV2LCBzdHJ1Y3Qgc3RtMzJfYWRjICphZGMpCj4gPiA+ID4gwqB7Cj4gPiA+ID4g
LcKgwqDCoMKgwqDCoMKgc3RydWN0IGRldmljZV9ub2RlICpub2RlID0gaW5kaW9fZGV2LT5kZXYu
b2Zfbm9kZTsKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmaW5k
aW9fZGV2LT5kZXY7Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGNvbnN0IHN0cnVjdCBzdG0zMl9h
ZGNfaW5mbyAqYWRjX2luZm8gPSBhZGMtPmNmZy0KPiA+ID4gPiA+YWRjX2luZm87Cj4gPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoGludCBudW1fY2hhbm5lbHMgPSAwLCByZXQ7Cj4gPiA+ID4gwqAKPiA+
ID4gPiAtwqDCoMKgwqDCoMKgwqByZXQgPSBvZl9wcm9wZXJ0eV9jb3VudF91MzJfZWxlbXMobm9k
ZSwgInN0LGFkYy0KPiA+ID4gPiBjaGFubmVscyIpOwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoHJl
dCA9IGRldmljZV9wcm9wZXJ0eV9jb3VudF91MzIoZGV2LCAic3QsYWRjLQo+ID4gPiA+IGNoYW5u
ZWxzIik7Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQgPiBhZGNfaW5mby0+bWF4X2No
YW5uZWxzKSB7Cj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXZfZXJy
KCZpbmRpb19kZXYtPmRldiwgIkJhZCBzdCxhZGMtCj4gPiA+ID4gY2hhbm5lbHM/XG4iKTsKPiA+
ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRUlOVkFMOwo+ID4g
PiA+IEBAIC0xODg1LDggKzE4ODUsOCBAQCBzdGF0aWMgaW50Cj4gPiA+ID4gc3RtMzJfYWRjX2dl
dF9sZWdhY3lfY2hhbl9jb3VudChzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2LAo+ID4gPiA+IHN0
cnVjdAo+ID4gPiA+IHN0bQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
bnVtX2NoYW5uZWxzICs9IHJldDsKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgfQo+ID4gPiA+IMKg
Cj4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgcmV0ID0gb2ZfcHJvcGVydHlfY291bnRfZWxlbXNfb2Zf
c2l6ZShub2RlLCAic3QsYWRjLQo+ID4gPiA+IGRpZmYtCj4gPiA+ID4gY2hhbm5lbHMiLAo+ID4g
PiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNpemVvZihzdHJ1Y3QKPiA+ID4g
PiBzdG0zMl9hZGNfZGlmZl9jaGFubmVsKSk7Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgLyogZWFj
aCBzdCxhZGMtZGlmZi1jaGFubmVscyBpcyBhIGdyb3VwIG9mIDIgdTMyICovCj4gPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgcmV0ID0gZGV2aWNlX3Byb3BlcnR5X2NvdW50X3U2NChkZXYsICJzdCxhZGMt
ZGlmZi0KPiA+ID4gPiBjaGFubmVscyIpOwo+ID4gCj4gPiBBcmUgeW91IGZpbmUgd2l0aCB0aGlz
IGNoYW5nZSAoc3RpbGwgZG9lcyBub3QgaGF2ZSBhbnkgcmVmZXJlbmNlIHRvCj4gPiB0aGUKPiA+
IHRhcmdldCBzdHJ1Y3QgYnV0IHRoZSBjb21tZW50IG1pZ2h0IGJlIGhlbHBmdWwgYW5kIHRoZXJl
J3Mgbm8gbWFnaWMKPiA+IDIpPwo+IAo+IAo+IFNpbmNlIHlvdSBhZGRlZCB0aGF0IGNvbW1lbnQs
IHRoaXMgc291bmRzIGJldHRlci4gSU1ITywgVGhpcyBzdGlsbAo+IGxvb2tzCj4gYSBiaXQgd2Vp
cmQuIEknZCBmZWVsIG1vcmUgY29tZm9ydGFibGUgYnkgdXNpbmcgdTMyIEFQSSBmb3IgYQo+ICd1
aW50MzItbWF0cml4JyBhcyBkZWZpbmVkIGluIGR0LWJpbmRpbmdzLgo+IFN0cmljdGx5IHNwZWFr
aW5nLCBzb21ldGhpbmcgbGlrZQo+IHNpemVvZihzdHJ1Y3Qgc3RtMzJfYWRjX2RpZmZfY2hhbm5l
bCkgLyBzaXplb2YodTMyKSBjb3VsZCBiZSB1c2VkLAo+IGFsb25nCj4gd2l0aCB0aGlzIGNvbW1l
bnQgYW5kIGRldmljZV9wcm9wZXJ0eV9jb3VudF91MzIoKSB0byBtYWtlIGl0IGNsZWFyID8KPiAK
Ck5vIHN0cm9uZyBvcHRpb24gc28gSSBjYW4gZG8gYXMgeW91IHByZWZlcjoKCglyZXQgPSBkZXZp
Y2VfcHJvcGVydHlfY291bnRfdTMyKCk7CglpZiAocmV0IC/CoAooc2l6ZW9mKHN0cnVjdCBzdG0z
Ml9hZGNfZGlmZl9jaGFubmVsKSAvIHNpemVvZih1MzIpKSA+IG1heF9jaGFuKSB7CgkJLi4uCgl9
CgkuLi4KClByb2JhYmx5IGl0J3MgYSBnb29kIGlkZWEgdG8gc3RvcmUgdGhhdCBzaXplb2YoKSBk
aXZpc2lvbiBpbiBhIGxvY2FsCnZhcmlhYmxlIDopCgotIE51bm8gU8OhCgo+ID4gPiAKPiAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
