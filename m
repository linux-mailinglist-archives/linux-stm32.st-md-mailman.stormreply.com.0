Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59342537487
	for <lists+linux-stm32@lfdr.de>; Mon, 30 May 2022 09:14:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5242C5E2C6;
	Mon, 30 May 2022 07:14:10 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42E85C03FCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 May 2022 09:18:08 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id v9so7092871lja.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 May 2022 02:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HVRfiub+OH+3yERsymAq7YJAzta8XBR77uv0v0VV0CI=;
 b=emBIciAFdQnHcKQSohgcuqMQM4xd/Tz5hPJWkxKaoqpZiunJ9s/OTs4WGMG95NSW4L
 IgZczc+9GJXxJcHaJPXn5wGWSwvNNr7NK0iPiKDna7ZgvHSU3H+3cqKDq++bLMIID/pg
 WGi2IGkojhYGQUTThKK+rMJIPdLBixIvgKrHxkmswTwOqRnEJD7L5yQqGEaEOrvK5lk+
 qkpbzv53N91WJdtTRf68St7YDzO4K7K4CZ379sj7xnW+IFrVVRAmkaJKxBPwkYKBzJkg
 l3Y5YpoNbKupcj3Ag1FqEF0wqmBD5ctEDUT8y+jgldf7YfuRmpnjc1XtWB+r4HJU6Val
 yWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HVRfiub+OH+3yERsymAq7YJAzta8XBR77uv0v0VV0CI=;
 b=nuAYB8UqpBJhbdHrlYGKiF/E14GC6usPPotWaSvwLw1rjN6sotGlvBjKSVynaUKbbw
 a6MrvBMLUEBPPfbMw2XGcPyirxlz3xyvJxXEKEdiFBgSMsq8lZWZurByGQUDXOAPY21B
 HH0Loyt5tKmD3NUllsCEK08k2V23sGuHIwcZFtYjh8raU0ztLFU6NjB4LIMcItgQY6Zp
 wz50A63wljvW6A5GghnHFgWgRp2EkrmE/BYEiYI9UeTIIZPSig2JYME7U1lE9II/4Ltc
 USpvpyQMGbH0zIKJ2uZGz/9KINgYmL+1Z02IQnYpS5KOYUQ7Fw0mZFU4ZeAU3Gw104n0
 3evw==
X-Gm-Message-State: AOAM532P1tPoUf+d9neCLeeatGLLE/5pFCK/+WirhXBqWTNhHMnLxCb3
 /gSz3t2yvOX+CCdyeuXv4uY=
X-Google-Smtp-Source: ABdhPJxNkzG4eousUKAj15zHH6g3YqSnU9H8B29bmyYBmgxkfeUg1JCXHoHxE95njq7TczFOLpZl7Q==
X-Received: by 2002:a2e:a5ca:0:b0:253:c604:647c with SMTP id
 n10-20020a2ea5ca000000b00253c604647cmr27577549ljp.403.1653729487689; 
 Sat, 28 May 2022 02:18:07 -0700 (PDT)
Received: from [10.0.0.127] (91-159-150-230.elisa-laajakaista.fi.
 [91.159.150.230]) by smtp.gmail.com with ESMTPSA id
 v9-20020a2ea449000000b0024f3d1daee2sm1402828ljn.106.2022.05.28.02.18.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 May 2022 02:18:07 -0700 (PDT)
Message-ID: <454f31e4-12ce-2bee-8e95-d75854b34380@gmail.com>
Date: Sat, 28 May 2022 12:19:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <20220519154318.2153729-53-ckeepax@opensource.cirrus.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20220519154318.2153729-53-ckeepax@opensource.cirrus.com>
X-Mailman-Approved-At: Mon, 30 May 2022 07:14:09 +0000
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, daniel@zonque.org,
 kernel@pengutronix.de, shawnguo@kernel.org, jarkko.nikula@bitmer.com
Subject: Re: [Linux-stm32] [PATCH 52/56] ASoC: ti: Rename set_fmt_new back
	to set_fmt
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

CgpPbiAxOS8wNS8yMDIyIDE4OjQzLCBDaGFybGVzIEtlZXBheCB3cm90ZToKPiBOb3cgdGhlIGNv
cmUgaGFzIGJlZW4gbWlncmF0ZWQgYWNyb3NzIHRvIHRoZSBuZXcgZGlyZWN0IGNsb2NrCj4gc3Bl
Y2lmaWNhdGlvbiB3ZSBjYW4gbW92ZSB0aGUgZHJpdmVycyBiYWNrIHRvIHRoZSBub3JtYWwgc2V0
X2ZtdAo+IGNhbGxiYWNrLgoKQWNrZWQtYnk6IFBldGVyIFVqZmFsdXNpIDxwZXRlci51amZhbHVz
aUBnbWFpbC5jb20+Cgo+IFNpZ25lZC1vZmYtYnk6IENoYXJsZXMgS2VlcGF4IDxja2VlcGF4QG9w
ZW5zb3VyY2UuY2lycnVzLmNvbT4KPiAtLS0KPiAgc291bmQvc29jL3RpL2RhdmluY2ktaTJzLmMg
ICB8IDIgKy0KPiAgc291bmQvc29jL3RpL2RhdmluY2ktbWNhc3AuYyB8IDIgKy0KPiAgc291bmQv
c29jL3RpL29tYXAtbWNic3AuYyAgICB8IDIgKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy90aS9k
YXZpbmNpLWkycy5jIGIvc291bmQvc29jL3RpL2RhdmluY2ktaTJzLmMKPiBpbmRleCBjNzM2OGQ1
Mjk2Njg4Li5mZTU3MmI3MjBiMDk0IDEwMDY0NAo+IC0tLSBhL3NvdW5kL3NvYy90aS9kYXZpbmNp
LWkycy5jCj4gKysrIGIvc291bmQvc29jL3RpL2RhdmluY2ktaTJzLmMKPiBAQCAtNjA2LDcgKzYw
Niw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19kYWlfb3BzIGRhdmluY2lfaTJzX2Rh
aV9vcHMgPSB7Cj4gIAkucHJlcGFyZQk9IGRhdmluY2lfaTJzX3ByZXBhcmUsCj4gIAkudHJpZ2dl
cgk9IGRhdmluY2lfaTJzX3RyaWdnZXIsCj4gIAkuaHdfcGFyYW1zCT0gZGF2aW5jaV9pMnNfaHdf
cGFyYW1zLAo+IC0JLnNldF9mbXRfbmV3CT0gZGF2aW5jaV9pMnNfc2V0X2RhaV9mbXQsCj4gKwku
c2V0X2ZtdAk9IGRhdmluY2lfaTJzX3NldF9kYWlfZm10LAo+ICAJLnNldF9jbGtkaXYJPSBkYXZp
bmNpX2kyc19kYWlfc2V0X2Nsa2RpdiwKPiAgCj4gIH07Cj4gZGlmZiAtLWdpdCBhL3NvdW5kL3Nv
Yy90aS9kYXZpbmNpLW1jYXNwLmMgYi9zb3VuZC9zb2MvdGkvZGF2aW5jaS1tY2FzcC5jCj4gaW5k
ZXggOTYxYmFjNjk2MzY1Mi4uZTJhYWI0NzI5ZjNhYiAxMDA2NDQKPiAtLS0gYS9zb3VuZC9zb2Mv
dGkvZGF2aW5jaS1tY2FzcC5jCj4gKysrIGIvc291bmQvc29jL3RpL2RhdmluY2ktbWNhc3AuYwo+
IEBAIC0xNjIwLDcgKzE2MjAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfZGFpX29w
cyBkYXZpbmNpX21jYXNwX2RhaV9vcHMgPSB7Cj4gIAkudHJpZ2dlcgk9IGRhdmluY2lfbWNhc3Bf
dHJpZ2dlciwKPiAgCS5kZWxheQkJPSBkYXZpbmNpX21jYXNwX2RlbGF5LAo+ICAJLmh3X3BhcmFt
cwk9IGRhdmluY2lfbWNhc3BfaHdfcGFyYW1zLAo+IC0JLnNldF9mbXRfbmV3CT0gZGF2aW5jaV9t
Y2FzcF9zZXRfZGFpX2ZtdCwKPiArCS5zZXRfZm10CT0gZGF2aW5jaV9tY2FzcF9zZXRfZGFpX2Zt
dCwKPiAgCS5zZXRfY2xrZGl2CT0gZGF2aW5jaV9tY2FzcF9zZXRfY2xrZGl2LAo+ICAJLnNldF9z
eXNjbGsJPSBkYXZpbmNpX21jYXNwX3NldF9zeXNjbGssCj4gIAkuc2V0X3RkbV9zbG90CT0gZGF2
aW5jaV9tY2FzcF9zZXRfdGRtX3Nsb3QsCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy90aS9vbWFw
LW1jYnNwLmMgYi9zb3VuZC9zb2MvdGkvb21hcC1tY2JzcC5jCj4gaW5kZXggNWJmYjU2ZDRmZjg0
NC4uNThkOGUyMDBhN2I5NyAxMDA2NDQKPiAtLS0gYS9zb3VuZC9zb2MvdGkvb21hcC1tY2JzcC5j
Cj4gKysrIGIvc291bmQvc29jL3RpL29tYXAtbWNic3AuYwo+IEBAIC0xMjcxLDcgKzEyNzEsNyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfZGFpX29wcyBtY2JzcF9kYWlfb3BzID0gewo+
ICAJLnRyaWdnZXIJPSBvbWFwX21jYnNwX2RhaV90cmlnZ2VyLAo+ICAJLmRlbGF5CQk9IG9tYXBf
bWNic3BfZGFpX2RlbGF5LAo+ICAJLmh3X3BhcmFtcwk9IG9tYXBfbWNic3BfZGFpX2h3X3BhcmFt
cywKPiAtCS5zZXRfZm10X25ldwk9IG9tYXBfbWNic3BfZGFpX3NldF9kYWlfZm10LAo+ICsJLnNl
dF9mbXQJPSBvbWFwX21jYnNwX2RhaV9zZXRfZGFpX2ZtdCwKPiAgCS5zZXRfY2xrZGl2CT0gb21h
cF9tY2JzcF9kYWlfc2V0X2Nsa2RpdiwKPiAgCS5zZXRfc3lzY2xrCT0gb21hcF9tY2JzcF9kYWlf
c2V0X2RhaV9zeXNjbGssCj4gIH07CgotLSAKUMOpdGVyCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
