Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D10BE4E6A2C
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Mar 2022 22:20:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82195C60497;
	Thu, 24 Mar 2022 21:20:03 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7D1DC60469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Mar 2022 21:20:02 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 w17-20020a056830111100b005b22c584b93so4187092otq.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Mar 2022 14:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nZWBFSxF5EcD/7zsReIxioOFi/XH9lIHO9AjBk+DuYQ=;
 b=oArtMJ/tbkd3Z6nYyHlU7fvXux7LQDDOd60St/ov9Mj+w78jN5l04zJp45fpl1OAID
 VRj9qOEnl2opqDPdiv91hztwpdDzPY2WN3oxsDuAB1cEk3FGJEcMW4kkwwS5w/NPOUHQ
 EfW6OGHTPEMwn4XpoX5ftaNPYL9wQLL9HbhlG+AlYhleXb/wdkGuebUAT7XHh7rECyRV
 PzA99lrinAjhqb3UMN1wWZz9EeJH9BHmnahpbvzHqTO9GEJcqZUt9mKnhBdhjFQex2Yv
 NuP8J1wKYIj+35Hw+ITVMF2gDg4pDpX98N7m9bUg3KKAmWD6i9BEIQbww03xmeu1uUzR
 ofUg==
X-Gm-Message-State: AOAM533SIqMMolQDQyeT2TgBTkyptqACbG+BTx7+ehytbQrcU5TF2r2q
 nVoFHuL8eYh8PmrFXK5rxw==
X-Google-Smtp-Source: ABdhPJyODYrocQIME0OAE9G5smC2auk9j+xSOw5TB2oty2nbpPQU2zFSF3ULc0wpM/GONsqTcT7sJw==
X-Received: by 2002:a9d:7319:0:b0:5cd:121e:e11 with SMTP id
 e25-20020a9d7319000000b005cd121e0e11mr3043744otk.148.1648156801286; 
 Thu, 24 Mar 2022 14:20:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t10-20020a056830224a00b005cd9db03fabsm1806726otd.78.2022.03.24.14.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 14:20:00 -0700 (PDT)
Received: (nullmailer pid 2592144 invoked by uid 1000);
 Thu, 24 Mar 2022 21:19:59 -0000
Date: Thu, 24 Mar 2022 16:19:59 -0500
From: Rob Herring <robh@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Message-ID: <Yjzgf10zAhrkpYde@robh.at.kernel.org>
References: <20220309134702.9942-1-jason-jh.lin@mediatek.com>
 <CAL_Jsq+=hTKTjB8rR77_uQYKDWHzLyTdeU7zbixSCZCNrdmNvg@mail.gmail.com>
 <CAAOTY__kzL8YuGo-oKct4c_bL-Ch5rW8wBpkhOXkK+a10gNXVg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAOTY__kzL8YuGo-oKct4c_bL-Ch5rW8wBpkhOXkK+a10gNXVg@mail.gmail.com>
Cc: Fei Shao <fshao@chromium.org>, David Airlie <airlied@linux.ie>,
 singo.chang@mediatek.com, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "roy-cw.yeh" <roy-cw.yeh@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 DTML <devicetree@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Nancy Lin <nancy.lin@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v2 0/4] Fix MediaTek display dt-bindings
	issues
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

T24gVGh1LCBNYXIgMjQsIDIwMjIgYXQgMDk6MjU6NDRQTSArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3
cm90ZToKPiBIaSwgUm9iOgo+IAo+IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IOaWvCAy
MDIy5bm0M+aciDIz5pelIOmAseS4iSDkuIvljYgxMDoxMOWvq+mBk++8mgo+ID4KPiA+IE9uIFdl
ZCwgTWFyIDksIDIwMjIgYXQgNzo0NyBBTSBqYXNvbi1qaC5saW4gPGphc29uLWpoLmxpbkBtZWRp
YXRlay5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBUaGUgdmRvc3lzMCBzZXJpZXMgY2FycmllZCBh
IG5pY2UgZHQtYmluZGluZ3MgY29udmVyc2lvbiBvZiB0aGUgb2xkCj4gPiA+IHR4dCBkb2N1bWVu
dGF0aW9uIGZvciB0aGUgZW50aXJlIG1lZGlhdGVrLWRybSBkcml2ZXIsIGJ1dCBzb21lIG9mCj4g
PiA+IHRoZSBpc3N1ZXMgaW4gdGhlcmUgd2VyZW4ndCBzZWVuLgo+ID4gPgo+ID4gPiBUaGlzIHNl
cmllcyBpcyBmaXhpbmcgYWxsIG9mIHRoZSBpc3N1ZXMgcG9pbnRlZCBvdXQgYnkgYQo+ID4gPiBg
ZHRfYmluZGluZ19jaGVja2AgcnVuLCBmb2xsb3dlZCBieSBgZHRic19jaGVja2AuCj4gPiA+Cj4g
PiA+IENoYW5nZSBpbiB2MjoKPiA+ID4gLSByZW1vdmUgbWVkaWF0ZWssZXRoZHIueWFtbCBmaWxl
Cj4gPiA+IC0gY2hhbmdlIGluY2x1ZGUgaGVhZGVyIG9mIG1lZGlhdGVrLG92bC0ybC55YW1sIGZy
b20gbXQ4MTczIHRvIG10ODE4Mwo+ID4gPgo+ID4gPiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdu
byAoMyk6Cj4gPiA+ICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1lZGlhdGVrLCBtdXRleDogRml4
IG1lZGlhdGVrLCBnY2UtZXZlbnRzIHR5cGUKPiA+ID4gICBkdC1iaW5kaW5nczogZGlzcGxheTog
bWVkaWF0ZWssIG92bDogRml4ICdpb21tdScgcmVxdWlyZWQgcHJvcGVydHkKPiA+ID4gICAgIHR5
cG8KPiA+ID4gICBkdC1iaW5kaW5nczogZGlzcGxheTogbWVkaWF0ZWs6IEZpeCBleGFtcGxlcyBv
biBuZXcgYmluZGluZ3MKPiA+ID4KPiA+ID4gamFzb24tamgubGluICgxKToKPiA+ID4gICBSZXZl
cnQgImR0LWJpbmRpbmdzOiBkaXNwbGF5OiBtZWRpYXRlazogYWRkIGV0aGRyIGRlZmluaXRpb24g
Zm9yCj4gPiA+ICAgICBtdDgxOTUiCj4gPgo+ID4gQ2FuIHRoaXMgc2VyaWVzIGdldCBhcHBsaWVk
IHNvb24/IGxpbnV4LW5leHQgaXMgc3RpbGwgYnJva2VuLgo+ID4KPiA+IElmIGl0IGhpdHMgTGlu
dXMnIHRyZWUsIEkgd2lsbCBiZSBhcHBseWluZyB0aGVtLgo+IAo+IEkndmUgYXBwbGllZCB0aGlz
IHNlcmllcyB0byBteSB0cmVlIFsxXSwgYnV0IG5vdyBpcyBtZXJnZSB3aW5kb3csIHNvIEkKPiBw
bGFuIHRvIHNlbmQgdGhpcyBzZXJpZXMgdGhyb3VnaCBEYXZlJ3MgdHJlZSBhZnRlciA1LjE4LXJj
MS4gV291bGQKPiB0aGlzIGJlIHRvbyBsYXRlIGZvciB5b3U/CgpZZXMsIHBlb3BsZSBiYXNlIHRo
ZWlyIGRldmVsb3BtZW50IG9uIC1yYzEgYW5kIGl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSAKYSBm
dW5jdGlvbmFsIHRyZWUuCgpUaGVyZSdzIG5vdCByZWFsbHkgYW55IG5lZWQgdG8gd2FpdCB0byBz
ZW5kIGZpeGVzLgoKUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
