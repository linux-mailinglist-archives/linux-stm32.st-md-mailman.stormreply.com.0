Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC09648AEF
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Dec 2022 23:54:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B98BC65E52;
	Fri,  9 Dec 2022 22:54:20 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D666AC64109
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Dec 2022 22:54:19 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 05462320090F;
 Fri,  9 Dec 2022 17:54:15 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Fri, 09 Dec 2022 17:54:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1670626455; x=
 1670712855; bh=2w8Q3gDoHJ7xfwlWd+vqHAWIlCTMqE+wn4Znlt45bOI=; b=D
 J7rZsLwO92uP++57nWL4H1BwyBr0KYLnFGWkdPMzlYtuFp1iTbhJX2mgysDRCdhF
 T6q4mHMclXNDsYr3fuoeeXEwyyYTiv14+nRUNNfyKdb8d4Ih5bphO/pEXJMq/vfq
 zGg1gO/b/EV2K0UHcOoCXH4xDQPPu+uB3rq71wHhTQglT2QEp9tznfps8AOnSwHc
 xv0bv3py9V2TbJDzQyWaQONEV8w57jdOisHl9VIS19vajVTbB5T3swoUpWOTQ6m6
 AnzmUULgIBVcq9BUf3PViTId86A1+7RSK9TY10YJK90ZqM883oYmykRQl66nWEE3
 W8JdBOMJItf1BQ/YE9Xjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1670626455; x=
 1670712855; bh=2w8Q3gDoHJ7xfwlWd+vqHAWIlCTMqE+wn4Znlt45bOI=; b=T
 xvpyupwQxDuNDfhBre/HGW3KSGVztZb38dFPGBBUi1ISifMkPBhRKMuFXQYAFPLR
 V1rP4qoN7KHTJvLb18Q43ZnruoWkfCN4tEFjaNhf7LkxeBWXliBdpOR+zkw0NHkk
 nv8I5M2iE7vmLxBjqzN+yzaYMVXpmXk03xUoWHfAdu40o2pNU6TppkVdXKmiDjWT
 6eFltW6n4+N7unKJGcJ3/yGerDljpmEVxQMAUBuLD+kJ9e8tEJt+FVbiTJDQarJh
 aLdwCtQKvRXld6/njJqC360a9Z1qgo94MnR+UWsVg9Ex49mcXmvlaBQgvm8MezLJ
 In1VWdLNxwLcM2669eUIQ==
X-ME-Sender: <xms:lryTY-GP86-668cpi-aV4CLKXlAINHtWgoVLsRrAlFJkjyZWpWTkjw>
 <xme:lryTY_WEWseN4mEIdRiqrbL5yn-zbSBgrQtUmM8OAjKaziGBw8zpW7s-NTh-eo-Vh
 Yp5jowWEXVIp9tMZ0k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefgddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:lryTY4ISOzRAgKhiueETEGfeJ0TCDrNNkrQ4DRKM4xKvGjwNP-2QVg>
 <xmx:lryTY4EZg2Cc6mFXFVKf0xjHbPqzQOWRSIGSHXyUlBPniYmhO_LFuw>
 <xmx:lryTY0WG631a3oWGIuVlYo8lFUmXra5_t_WdXioYnJcj20NgODoKFQ>
 <xmx:l7yTY6EuO_rVZbKO8m_XMWubJZvbid7j0U0yKAm2ZnZRyQbSL5dKiQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D104FB60086; Fri,  9 Dec 2022 17:54:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <96e8a731-bf92-4cfd-b0be-dfbcb7a076c6@app.fastmail.com>
In-Reply-To: <20221209220555.3631364-1-u.kleine-koenig@pengutronix.de>
References: <20221209220555.3631364-1-u.kleine-koenig@pengutronix.de>
Date: Fri, 09 Dec 2022 23:53:49 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "Inki Dae" <inki.dae@samsung.com>, "Seung-Woo Kim" <sw0312.kim@samsung.com>,
 "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Dave Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Tomi Valkeinen" <tomba@kernel.org>, 
 "Alain Volmat" <alain.volmat@foss.st.com>,
 "Yannick Fertre" <yannick.fertre@foss.st.com>,
 "Raphael Gallais-Pou" <raphael.gallais-pou@foss.st.com>,
 "Philippe Cornu" <philippe.cornu@foss.st.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>
Cc: linux-samsung-soc@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] drm: Drop ARCH_MULTIPLATFORM from
	dependencies
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

T24gRnJpLCBEZWMgOSwgMjAyMiwgYXQgMjM6MDUsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+
IFNvbWUgb2YgdGhlc2UgZGVwZW5kZW5jaWVzIHVzZWQgdG8gYmUgc2Vuc2libGUgd2hlbiBvbmx5
IGEgc21hbGwgcGFydCBvZgo+IHRoZSBwbGF0Zm9ybXMgc3VwcG9ydGVkIGJ5IEFSQ0g9YXJtIGNv
dWxkIGJlIGNvbXBpbGVkIHRvZ2V0aGVyIGluIGEKPiBzaW5nbGUga2VybmVsIGltYWdlLiBOb3dh
ZGF5cyBBUkNIX01VTFRJUExBVEZPUk0gaXMgb25seSB1c2VkIGFzIGEgZ3VhcmQKPiBmb3Iga2Vy
bmVsIG9wdGlvbnMgaW5jb21wYXRpYmxlIHdpdGggYSBtdWx0aXBsYXRmb3JtIGltYWdlLiBTZWUg
Y29tbWl0Cj4gODRmYzg2MzYwNjIzICgiQVJNOiBtYWtlIEFSQ0hfTVVMVElQTEFURk9STSB1c2Vy
LXZpc2libGUiKSBmb3Igc29tZSBtb3JlCj4gZGV0YWlscy4KPgo+IFNpZ25lZC1vZmYtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+CgpNYWtlcyBz
ZW5zZSwKCkFja2VkLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgoKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vS2NvbmZpZyAKPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9vbWFwZHJtL0tjb25maWcKPiBpbmRleCA0NTVlMWE5MWYwZTUuLjc2ZGVkMTU2OGJkMCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9LY29uZmlnCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL29tYXBkcm0vS2NvbmZpZwo+IEBAIC0yLDcgKzIsNyBAQAo+ICBjb25maWcgRFJN
X09NQVAKPiAgCXRyaXN0YXRlICJPTUFQIERSTSIKPiAgCWRlcGVuZHMgb24gRFJNICYmIE9GCj4g
LQlkZXBlbmRzIG9uIEFSQ0hfT01BUDJQTFVTIHx8IEFSQ0hfTVVMVElQTEFURk9STQo+ICsJZGVw
ZW5kcyBvbiBBUkNIX09NQVAyUExVUwo+ICAJc2VsZWN0IERSTV9LTVNfSEVMUEVSCj4gIAlzZWxl
Y3QgVklERU9NT0RFX0hFTFBFUlMKPiAgCXNlbGVjdCBIRE1JCgpTaW5jZSB0aGUgb3JpZ2luYWwg
cHVycG9zZSBvZiB0aGUgfHxBUkNIX01VTFRJUExBVEZPUk0gd2FzIHRvIGFsbG93CmJ1aWxkaW5n
IHRoZSBkcml2ZXIgb24gbW9yZSB0YXJnZXRzLCBJIHdvbmRlciBpZiB3ZSBzaG91bGQgaW5zdGVh
ZAptYWtlIHRoYXQgfHxDT01QSUxFX1RFU1QsIHdoaWNoIHdvdWxkIGFsc28gYWxsb3cgYnVpbGRp
bmcgaXQgb24KeDg2IGFuZCBvdGhlcnMuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
c3RpL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vc3RpL0tjb25maWcKPiBpbmRleCBmMmE4ODBj
NDg0ODUuLjNjN2E1ZmVmZjhkZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RpL0tj
b25maWcKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RpL0tjb25maWcKPiBAQCAtMSw3ICsxLDcg
QEAKPiAgIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5Cj4gIGNvbmZpZyBE
Uk1fU1RJCj4gIAl0cmlzdGF0ZSAiRFJNIFN1cHBvcnQgZm9yIFNUTWljcm9lbGVjdHJvbmljcyBT
b0Mgc3RpSDR4eCBTZXJpZXMiCj4gLQlkZXBlbmRzIG9uIE9GICYmIERSTSAmJiAoQVJDSF9TVEkg
fHwgQVJDSF9NVUxUSVBMQVRGT1JNKQo+ICsJZGVwZW5kcyBvbiBPRiAmJiBEUk0gJiYgQVJDSF9T
VEkKPiAgCXNlbGVjdCBSRVNFVF9DT05UUk9MTEVSCj4gIAlzZWxlY3QgRFJNX0tNU19IRUxQRVIK
PiAgCXNlbGVjdCBEUk1fR0VNX0RNQV9IRUxQRVIKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3N0bS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9LY29uZmlnCj4gaW5kZXggZGVk
NzJmODc5NDgyLi5mYTQ5Y2RlNDNiYjIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0
bS9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9LY29uZmlnCj4gQEAgLTEsNyAr
MSw3IEBACj4gICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+ICBjb25m
aWcgRFJNX1NUTQo+ICAJdHJpc3RhdGUgIkRSTSBTdXBwb3J0IGZvciBTVE1pY3JvZWxlY3Ryb25p
Y3MgU29DIFNlcmllcyIKPiAtCWRlcGVuZHMgb24gRFJNICYmIChBUkNIX1NUTTMyIHx8IEFSQ0hf
TVVMVElQTEFURk9STSkKPiArCWRlcGVuZHMgb24gRFJNICYmIEFSQ0hfU1RNMzIKPiAgCXNlbGVj
dCBEUk1fS01TX0hFTFBFUgo+ICAJc2VsZWN0IERSTV9HRU1fRE1BX0hFTFBFUgo+ICAJc2VsZWN0
IERSTV9QQU5FTF9CUklER0UKClNhbWUgaGVyZS4KCiAgICAgYXJuZApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
