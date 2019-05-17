Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3C6216CF
	for <lists+linux-stm32@lfdr.de>; Fri, 17 May 2019 12:14:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29FE2C0B762
	for <lists+linux-stm32@lfdr.de>; Fri, 17 May 2019 10:14:14 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 535E6C0B761
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 May 2019 10:14:12 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id h1so7372954qtp.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 May 2019 03:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zJAY/Pv8Q8rCNwC0Vbgeg982L/4wPTYgnNPmTbKhmDg=;
 b=iomWStGl4iQbx8eysPjAozeB43WumfOwhPB77ZRRDGP/507Zl7PX1Gq7HJ1rJ9Eqlb
 HVJX7hCf6FtmuB82mMUTRb8z4gsMdsm94Bbwk5jKY74u28in3UC3C09azGNKeHNLNEdx
 Se7hyfP11juO1tqPdhboIE+k9wGUduPUC10mzjhJNBokCoUG/NZQhuCkGfOpdUziIQQQ
 XKiTGp25+uJ4xLUhWMDsE+fLqb+x/gbwNLg5CIT7WmhGSPIyHAFycNQ7EzPClNwB7Qwl
 BDtPhmPCodYbrRNYKxnLv7c06tdvUwlx5lKIbVBmg89br/GeOX+lAuwsbf8kxt8W01sd
 gZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zJAY/Pv8Q8rCNwC0Vbgeg982L/4wPTYgnNPmTbKhmDg=;
 b=VHK2/YedAul8JKIoMwEbcs+TXzm2tlfLTKL9YkPcjJl+f/suCwnDcZt3BCFIpk6AVF
 CvVVIRvRRtFwG9LDnSN0ncRp+VpW926t+ssJLCzoovJDA8Rg6jLKSFIFNxPWTL/uP/iZ
 u5D75QJp7Pcag+6F1BoeaiNZPo7gOdijzLte9+2qsthHEhT6K80u3Eyqz9nx0dVFzcOZ
 qRWnHbB7EHc2iQ1WfuDtaf7jqorTkb5u0Y9Tw5P+gfv5Go3H0tsCssfMp4KJgDoo9/OL
 iVHmDXk8XvtCqRWstw1a1WfLX2eWwJe8SFqcBTxeFNS8QD3tO4aVsCH0P4I1vHn30W+T
 pPyg==
X-Gm-Message-State: APjAAAUcrxXaSkdgijye9htAyKb3Bt+SZjUBRa8L5K10655AhmryC2sm
 jVulxWlR7zZP1qDFhwA++hz3KrUrAEXOJ4zlbyWZig==
X-Google-Smtp-Source: APXvYqz6mT2feKlh8y8KJBFeHaGvmta1tNVLx2J144g2NFmA84lEkdM2Ca/94epR0ewDk42GFLZtxmPXuKFrJ6HDE+g=
X-Received: by 2002:ac8:104:: with SMTP id e4mr47527750qtg.234.1558088051122; 
 Fri, 17 May 2019 03:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <1557826556-10079-1-git-send-email-yannick.fertre@st.com>
 <1557826556-10079-2-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1557826556-10079-2-git-send-email-yannick.fertre@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Fri, 17 May 2019 12:14:00 +0200
Message-ID: <CA+M3ks66kdeCEEzRj9B41YTQQkod5f5p9EgpjUZvnj=q36ak4Q@mail.gmail.com>
To: =?UTF-8?Q?Yannick_Fertr=C3=A9?= <yannick.fertre@st.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v4 1/2] dt-bindings: display: stm32: add
 supply property to DSI controller
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

TGUgbWFyLiAxNCBtYWkgMjAxOSDDoCAxMTozNiwgWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZl
cnRyZUBzdC5jb20+IGEgw6ljcml0IDoKPgo+IFRoaXMgcGF0Y2ggYWRkcyBkb2N1bWVudGF0aW9u
IG9mIGEgbmV3IHByb3BlcnR5IHBoeS1kc2ktc3VwcGx5IHRvIHRoZQo+IFNUTTMyIERTSSBjb250
cm9sbGVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRy
ZUBzdC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4g
UmV2aWV3ZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBzdC5jb20+CgpBcHBs
aWVkIG9uIGRybS1taXNjLW5leHQsCgpUaGFua3MsCkJlbmphbWluCgo+IC0tLQo+ICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnR4dCB8IDMg
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnR4
dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWx0
ZGMudHh0Cj4gaW5kZXggM2ViMWI0OC4uNjBjNTRkYSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9zdCxzdG0zMi1sdGRjLnR4dAo+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWx0ZGMu
dHh0Cj4gQEAgLTQwLDYgKzQwLDggQEAgTWFuZGF0b3J5IG5vZGVzIHNwZWNpZmljIHRvIFNUTTMy
IERTSToKPiAgLSBwYW5lbCBvciBicmlkZ2Ugbm9kZTogQSBub2RlIGNvbnRhaW5pbmcgdGhlIHBh
bmVsIG9yIGJyaWRnZSBkZXNjcmlwdGlvbiBhcwo+ICAgIGRvY3VtZW50ZWQgaW4gWzZdLgo+ICAg
IC0gcG9ydDogcGFuZWwgb3IgYnJpZGdlIHBvcnQgbm9kZSwgY29ubmVjdGVkIHRvIHRoZSBEU0kg
b3V0cHV0IHBvcnQgKHBvcnRAMSkuCj4gK09wdGlvbmFsIHByb3BlcnRpZXM6Cj4gKy0gcGh5LWRz
aS1zdXBwbHk6IHBoYW5kbGUgb2YgdGhlIHJlZ3VsYXRvciB0aGF0IHByb3ZpZGVzIHRoZSBzdXBw
bHkgdm9sdGFnZS4KPgo+ICBOb3RlOiBZb3UgY2FuIGZpbmQgbW9yZSBkb2N1bWVudGF0aW9uIGlu
IHRoZSBmb2xsb3dpbmcgcmVmZXJlbmNlcwo+ICBbMV0gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Nsb2NrL2Nsb2NrLWJpbmRpbmdzLnR4dAo+IEBAIC0xMDEsNiArMTAzLDcgQEAg
RXhhbXBsZSAyOiBEU0kgcGFuZWwKPiAgICAgICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1l
cyA9ICJwY2xrIiwgInJlZiI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmVzZXRzID0gPCZy
Y2MgU1RNMzJGNF9BUEIyX1JFU0VUKERTSSk+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJl
c2V0LW5hbWVzID0gImFwYiI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcGh5LWRzaS1zdXBw
bHkgPSA8JnJlZzE4PjsKPgo+ICAgICAgICAgICAgICAgICAgICAgICAgIHBvcnRzIHsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+IC0tCj4g
Mi43LjQKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
