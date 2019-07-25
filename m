Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DC674B0E
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jul 2019 12:06:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 224A2C28E31;
	Thu, 25 Jul 2019 10:06:03 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E965C32EA3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jul 2019 10:06:01 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id a15so48443626qtn.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jul 2019 03:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dY1dpg/OHfGT/mutmAs25ca6whmcjcdibSv9ZWjkmsM=;
 b=Jfhn1IH6hkL03mon/JSCxCgfxtUbbHpAWLvoKakLq9+OvKHCgOwv54x4UYs6F+oQMn
 pYkQIJEg75i+hHconcv4V1/srr2zzQ2gLAF18fBF3ME7Lvqc9OSkQogjIIcoEHtIYzD7
 NNOk23BB7KD8mkF2N8cBwWxrirrIwIZ3Q64/Qs4CiRdRhGrXqGztvhuRIsUjCcx7OsNh
 1K2hL6DNo+hoWiB/V+VadwE/INHTA+S7S2oEyb+FW0F1AAaeEosEGU3YUvgpHt443Dvu
 NWKMDxuEbXYfUF6UQWng1gU1awRncLz4AvRJgscAlnEgrW9grqqxYPfBxrxKl2dxOCEc
 99bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dY1dpg/OHfGT/mutmAs25ca6whmcjcdibSv9ZWjkmsM=;
 b=pF5PhtiJS9PBys01reyMaFi3aZlMhuUxx9MkN+1h2I3l4xM3KtRWCRvL4vY7v4lvvT
 SCE8aiGUEvi0jsTrP/Lv6+SY/1mwdT+Q77osjgXY7ZQ0X3Ul4svsFrk+D1HsNx5H8d/G
 WwpjviDimuIXTRvYSN49mMSMLHRrDLEEKjIK8Y3WV4eb9eSasYNhRzVEuymAWFAIEUu5
 16R1kQNqICDdf0BXzq1WvGUpl/kJQwmJYYHtF2F/G59ZPzPh2MtXZExOfpkq/hER1aWH
 mPQ/5Mhsv0RE7fLSHkVSSoJeQ4COI3QT9ZevyZ5Wb9xnQT+ip7ZGw3JbHnFuaosql0rs
 KH6w==
X-Gm-Message-State: APjAAAVp/SDWC55qixKbn4G4cDpP20FsXOarvVKWXp25vTqSY1KYb7lx
 mi+2tRPtOSpX5gKW27GSUINVZUbQ70GKHqTqAORb2g==
X-Google-Smtp-Source: APXvYqyNGztGQcRtMMJsWvdYYDKXUmMJH8KY8KYoJe4UVpVBo8GDSkeBtSiY93R7Znfd5M96vEy07a17By30LwrGnqE=
X-Received: by 2002:aed:36c5:: with SMTP id f63mr62620869qtb.239.1564049160250; 
 Thu, 25 Jul 2019 03:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <1563811560-29589-1-git-send-email-olivier.moysan@st.com>
 <1563811560-29589-3-git-send-email-olivier.moysan@st.com>
In-Reply-To: <1563811560-29589-3-git-send-email-olivier.moysan@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 25 Jul 2019 12:05:49 +0200
Message-ID: <CA+M3ks6aA2YpHG3Kb+JxxECvdWYkgOVabYqL4-QTUDYkM6N67Q@mail.gmail.com>
To: Olivier Moysan <olivier.moysan@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 jernej.skrabec@siol.net, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Jyri Sarha <jsarha@ti.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 2/3] dt-bindings: display: sii902x:
	Change audio mclk binding
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

TGUgbHVuLiAyMiBqdWlsLiAyMDE5IMOgIDE4OjA2LCBPbGl2aWVyIE1veXNhbiA8b2xpdmllci5t
b3lzYW5Ac3QuY29tPiBhIMOpY3JpdCA6Cj4KPiBBcyBzdGF0ZWQgaW4gU2lMOTAyMi8yNCBkYXRh
c2hlZXQsIG1hc3RlciBjbG9jayBpcyBub3QgcmVxdWlyZWQgZm9yIEkyUy4KPiBNYWtlIG1jbGsg
cHJvcGVydHkgb3B0aW9uYWwgaW4gRFQgYmluZGluZ3MuCj4KPiBGaXhlczogM2YxODAyMWY0M2Ez
ICgiZHQtYmluZGluZ3M6IGRpc3BsYXk6IHNpaTkwMng6IEFkZCBIRE1JIGF1ZGlvIGJpbmRpbmdz
IikKPgpBcHBsaWVkIG9uIGRybS1taXNjLW5leHQuClRoYW5rcywKQmVuamFtaW4KCj4gU2lnbmVk
LW9mZi1ieTogT2xpdmllciBNb3lzYW4gPG9saXZpZXIubW95c2FuQHN0LmNvbT4KPiBSZXZpZXdl
ZC1ieTogSnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4KPiBBY2tlZC1ieTogQW5kcnplaiBIYWpk
YSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3NpaTkwMngudHh0IHwgNSArKy0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9zaWk5MDJ4
LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9z
aWk5MDJ4LnR4dAo+IGluZGV4IDJkZjQ0YjdkMzgyMS4uNmUxNGUwODdjMGQwIDEwMDY0NAo+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9zaWk5
MDJ4LnR4dAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L2JyaWRnZS9zaWk5MDJ4LnR4dAo+IEBAIC0yNiw5ICsyNiw4IEBAIE9wdGlvbmFsIHByb3BlcnRp
ZXM6Cj4gICAgICAgICAtIGNsb2NrczogcGhhbmRsZSBhbmQgY2xvY2sgc3BlY2lmaWVyIGZvciBl
YWNoIGNsb2NrIGxpc3RlZCBpbgo+ICAgICAgICAgICAgIHRoZSBjbG9jay1uYW1lcyBwcm9wZXJ0
eQo+ICAgICAgICAgLSBjbG9jay1uYW1lczogIm1jbGsiCj4gLSAgICAgICAgICBEZXNjcmliZXMg
U0lJOTAyeCBNQ0xLIGlucHV0LiBNQ0xLIGlzIHVzZWQgdG8gcHJvZHVjZQo+IC0gICAgICAgICAg
SERNSSBhdWRpbyBDVFMgdmFsdWVzLiBUaGlzIHByb3BlcnR5IGlzIHJlcXVpcmVkIGlmCj4gLSAg
ICAgICAgICAiI3NvdW5kLWRhaS1jZWxscyItcHJvcGVydHkgaXMgcHJlc2VudC4gVGhpcyBwcm9w
ZXJ0eSBmb2xsb3dzCj4gKyAgICAgICAgICBEZXNjcmliZXMgU0lJOTAyeCBNQ0xLIGlucHV0LiBN
Q0xLIGNhbiBiZSB1c2VkIHRvIHByb2R1Y2UKPiArICAgICAgICAgIEhETUkgYXVkaW8gQ1RTIHZh
bHVlcy4gVGhpcyBwcm9wZXJ0eSBmb2xsb3dzCj4gICAgICAgICAgICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvY2xvY2svY2xvY2stYmluZGluZ3MudHh0Cj4gICAgICAgICAgICBj
b25zdW1lciBiaW5kaW5nLgo+Cj4gLS0KPiAyLjcuNAo+Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
