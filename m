Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65401547F62
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jun 2022 08:10:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D0AAC6046D;
	Mon, 13 Jun 2022 06:10:56 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90C71C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 19:48:25 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id s1so14691298wra.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 12:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=Uw42AgxCz2OX29JjZrfK1zeziXwl4MAn7te6Qnb21ik=;
 b=VnmBwWKvliqZ17mqAO3YFUhuijHFVCA0X/6JoDEeNmtQ5fuB2ME76Abp7kguBl57K7
 M9/alivbnhSTovq/B//wCei53pyxQ+HtrJaffG1iGtF9Ndaudu7kcr9ovspAlwBkBSrl
 Qk8wAlB8QCS5xW3y97CMGT7D89Ky4udjBupXK19Q8pH4R+6TZMpKLOBEkE6ub91Xaf7Y
 S7oL2lI6/EzqlSBNis27lv8/Z8dTYnHGhUC0YHRirC4Dqxm1vVmg/6fapPeKzP00VvFU
 tNNMy6jrpva6Bk+UcwypSwoLQSKLiQbVV7FbXXq9G/VEvyzMlVefQmke6B2XscRqIWLl
 voDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Uw42AgxCz2OX29JjZrfK1zeziXwl4MAn7te6Qnb21ik=;
 b=IdBWG6UgBdJqeiUbOv5B/G8GXBNWa5mtOj/+pAJ6ZO6RhEtwxY0oDjBrDNUevfJBiT
 pzJFl0FpS8680U3k6fMVKKvBU/Db8RWu22WHHNWODSYT3ib7+gqgGO+KHP+iSGz5DD9t
 R0R7PAcZyifrHxIxZdNPrdhvFzGqplt0rxGPX/Q7P6RYmTSgd6t0wvwQ912iNOf2+zrv
 5az566uRwhzM4p6HJ7VKCxDOpTmzB796UZuJy7wGxUIAiHNMY2pP6y76nhZQ/X6TrbTo
 y95NY9oCghNoSpw3ibUT11knInI5PjtVe5y+djq9vlKf7y4MOjLpMvxmS6K8jIhvzsEN
 XVrg==
X-Gm-Message-State: AOAM531XjF8Dkc794K5JzExOTUGYkg5tM/CMLdPyj35WwI1XhYFvjFDf
 K06NXRQg9xhCv1SqpfuXBgM=
X-Google-Smtp-Source: ABdhPJy5G62/5XmSgGYkKL4gT5Hd/Ethb/qClZrbwW5M3Zb4SLtoP92M/h2fB9W3tywpi7sFv5O92A==
X-Received: by 2002:a5d:5983:0:b0:218:519e:78a5 with SMTP id
 n3-20020a5d5983000000b00218519e78a5mr20645990wri.718.1654890504947; 
 Fri, 10 Jun 2022 12:48:24 -0700 (PDT)
Received: from ?IPv6:2001:a61:136e:3c01:8bd4:cf6f:76f1:a861?
 ([2001:a61:136e:3c01:8bd4:cf6f:76f1:a861])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a5d6503000000b002103136623esm257905wru.85.2022.06.10.12.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 12:48:24 -0700 (PDT)
Message-ID: <25e286370d34419c3fc32a75896d5bfebc4128ea.camel@gmail.com>
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>
Date: Fri, 10 Jun 2022 21:48:22 +0200
In-Reply-To: <CAHp75VcPoZ4FKTwDN_F76EZAcWYzAe1CHmuRuaP0wg3BgmPtfA@mail.gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-23-nuno.sa@analog.com>
 <CAHp75VcPoZ4FKTwDN_F76EZAcWYzAe1CHmuRuaP0wg3BgmPtfA@mail.gmail.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 Jun 2022 06:10:54 +0000
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio <linux-iio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>,
 Nancy Yuen <yuenn@google.com>, Andy Gross <agross@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>, Zhang Rui <rui.zhang@intel.com>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Gwendal Grignou <gwendal@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Thara Gopinath <thara.gopinath@linaro.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 22/34] iio: inkern: only return error
 codes in iio_channel_get_*() APIs
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

T24gRnJpLCAyMDIyLTA2LTEwIGF0IDE3OjA1ICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6
Cj4gT24gRnJpLCBKdW4gMTAsIDIwMjIgYXQgMTA6NDggQU0gTnVubyBTw6EgPG51bm8uc2FAYW5h
bG9nLmNvbT4gd3JvdGU6Cj4gPiAKPiA+IEFQSXMgbGlrZSBvZl9paW9fY2hhbm5lbF9nZXRfYnlf
bmFtZSgpIGFuZCBvZl9paW9fY2hhbm5lbF9nZXRfYWxsKCkKPiA+IHdlcmUKPiA+IHJldHVybmlu
ZyBhIG1peCBvZiBOVUxMIGFuZCBlcnJvciBwb2ludGVycyBiZWluZyBOVUxMIHRoZSB3YXkgdG8K
PiA+ICJub3RpZnkiIHRoYXQgd2Ugc2hvdWxkIGRvIGEgInN5c3RlbSIgbG9va3VwIGZvciBjaGFu
bmVscy4gVGhpcwo+ID4gbWFrZQo+ID4gaXQgdmVyeSBjb25mdXNpbmcgYW5kIHByb25lIHRvIGVy
cm9ycyBhcyBjb21taXQgZGJiY2NmN2MyMGJmCj4gPiAoImlpbzogaW5rZXJuOiBmaXggcmV0dXJu
IHZhbHVlIGluCj4gPiBkZXZtX29mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKCkiKQo+ID4gcHJv
dmVzLiBPbiB0b3Agb2YgdGhpcywgcGF0dGVybnMgbGlrZSAnaWYgKGNoYW5uZWwgIT0gTlVMTCkg
cmV0dXJuCj4gPiBjaGFubmVsJwo+ID4gd2VyZSBiZWluZyB1c2VkIHdoZXJlIGNoYW5uZWwgY291
bGQgYWN0dWFsbHkgYmUgYW4gZXJyb3IgY29kZSB3aGljaAo+ID4gbWFrZXMgdGhlIGNvZGUgaGFy
ZCB0byByZWFkLgo+IAo+IC4uLgo+IAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG5wID0gbnAtPnBhcmVudDsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
bnAgJiYgIW9mX2dldF9wcm9wZXJ0eShucCwgImlvLWNoYW5uZWwtcmFuZ2VzIiwKPiA+IE5VTEwp
KQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biBOVUxMOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiBjaGFuOwo+IAo+IFNob3VsZG4ndCBpdCByZXR1cm4gYSBkZWRpY2F0ZWQgZXJyb3Ig
Y29kZSBhbmQgbm90IHNvbWUgYXJiaXRyYXJ5Cj4gb25lPwo+IEl0IG1heSBiZSBJIG1pc3NlZCBz
b21ldGhpbmcgYW5kIGNoYW4gaGFzIGEgY29ycmVjdCBlcnJvciBjb2RlIGluCj4gdGhpcwo+IGNh
c2UuLi4KPiAKClNpbmNlIGluIHRoaXMgY2FzZSB3ZSB3b24ndCBsb29rIGZvciBjaGFubmVscyBp
biB0aGUgcGFyZW50IGRldmljZSwgSSdtCmp1c3QgaG9ub3JpbmcgdGhlIGNvZGUgcmV0dXJuZWQg
YnkgJ29mX2lpb19jaGFubmVsX2dldCgpJy4KCj4gLi4uCj4gCj4gPiArwqDCoMKgwqDCoMKgIGlm
IChudW1tYXBzID09IDApwqDCoMKgwqDCoMKgIC8qIHJldHVybiAtRU5PREVWIHRvIHNlYXJjaCBt
YXAKPiA+IHRhYmxlICovCj4gCj4gQ29tbWVudCBpcyBzdXBlcmZsdW91cywgdGhlIG5leHQgbGlu
ZSBpcyBzZWxmLWV4cGxhaW5pbmcuCj4gCgpXZWxsLCBJIGFncmVlLiBJIGp1c3Qga2VwdCBhcyBp
dCB3YXMgb24gdGhlIG9yaWdpbmFsIGNvZGUuIENhbiBoYXBpbGx5CnJlbW92ZSBpdCBpZiBubyBv
bmUgb2JqZWN0cyBhZ2FpbnN0IGl0LgoKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJldHVybiBFUlJfUFRSKC1FTk9ERVYpOwo+IAo+IC4uLgo+IAo+ID4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKGNoYW5uZWwgIT0gTlVMTCkKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmICghSVNfRVJSKGNoYW5uZWwpIHx8IFBUUl9FUlIoY2hhbm5lbCkgPT0g
LQo+ID4gRVBST0JFX0RFRkVSKQo+IAo+IEJ0dywgaW4gdGhlIEdQSU8gbGlicmFyeSB3ZSBoYXZl
IGEgbWFjcm8gb3IgaW5saW5lciAoZG9uJ3QgcmVtZW1iZXIpCj4gdGhhdCByZXByZXNlbnRzIHN1
Y2ggYSBjb25kaXRpb25hbC4KPiBQZXJoYXBzIG1ha2UgaXQgKGlmIGl0J3MgYSBtYWNybykgZ2xv
YmFsLCBvciBpbnRyb2R1Y2UgYW4gaW5saW5lIGluCj4gSUlPPwo+IAo+IE9rYXksIGl0J3MgaGVy
ZToKPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xOS1yYzEvc291cmNlL2Ry
aXZlcnMvZ3Bpby9ncGlvbGliLmgjTDE3OQo+IAo+IEl0J3Mgc2ltaWxhciwgYnV0IG5vdCB0aGUg
c2FtZSwgc28ganVzdCBwbGF5IHdpdGggYW4gaWRlYSB0bwo+IGludHJvZHVjZQo+IHNvbWV0aGlu
ZyBpbiB0aGlzIGZpbGUsIG1heWJlIGl0J3Mgd29ydGggZG9pbmcgdGhpcywgbWF5YmUgbm90Lgo+
IAoKSSB3b3VsZCBhbHNvIGFyZ3VlIHRoYXQgY291bGQgYmUgc29tZXRoaW5nIGRvbmUgYWZ0ZXIg
dGhpcyBzZXJpZXMgZ2V0cwphcHBsaWVkLi4uCgotIE51bm8gU8OhCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
