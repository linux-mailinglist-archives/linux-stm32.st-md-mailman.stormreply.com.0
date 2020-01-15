Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C938013C66B
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2020 15:46:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A6EDC36B0F;
	Wed, 15 Jan 2020 14:46:04 +0000 (UTC)
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7117EC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2020 14:46:03 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id x1so7455760qvr.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2020 06:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ko4hPD0/HEbdUKAawr5GytPY5+uuzohUC9C8Ie0pz5Y=;
 b=GVPgqToKKsfItZLuncCcSCSiOOOzQELgjl02vuItdydovRi/jjLbd/JOQo1GG4/yi2
 SeI9ZjprOgMKRIqo9huTpzNqF7fL+KVTS3i0LVMRcZWtFXsuoTH1d+mnp4oUwZ91znVL
 2OHiDYrQRvpZehPTyzx8sm/zicwctaDhOyEpjsTmC1ZVASnj1enNLjgJ+9ZwbCs/4D2D
 +7QHAEV4Bk/ilsjfNS3qd7c06P8I3Ddy+qX+z5amLDnZTN3DYFzIIG+dymoK+TGLTqT2
 qLwosPpHMEipV0Z/Za3iUlyG7qll3GFOaCRZUqLUxD0FGhP7hiRZmQjf3rr8U1K2a5cg
 QhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ko4hPD0/HEbdUKAawr5GytPY5+uuzohUC9C8Ie0pz5Y=;
 b=tVa58czsa4zyvK3Bq1wZKKEImWNA+q1N+lw7MVaoNN+/OGx2oqxwTZaYm9PtjNuLAt
 /AXU9uJazH1QpOb04WPMbyf9tMIe+TiiO1ic75LC5iHEuzcaJK9BqTIqmYrS1Funse7C
 CnUxMQSqGYW83WEwLgoT3Cy0k99DjH1IqszWk8jTzz6DWx6AQLQEuEBgQj1pY0MwmhMu
 U9Ev6v++ENG6uiZhUS0EdzU8hjNppHfGBmmbhcx1YdOHH4b1v84GVhL0G6kcoGp2iWPo
 Llz0JowWdbn9XFwdH8wF/Ib3o3y1RVBYNrP/48GHZikCe1ZwrDXzNTGbWDMAr71rHpaL
 v7kA==
X-Gm-Message-State: APjAAAUGTGgDj1mnPR6jS2QF7pRNyGcgn1po6IbNCRiXRSP0ZXWJVZxz
 StVOptbhEqeNgYT6fuBaLXMe+EiuOR04bALUqpBYrw==
X-Google-Smtp-Source: APXvYqxgx6sXyHqoMMdfsNegXLpS1jy2niaBHXeY33uGOlo7Pj2t0SYiM0IhcMd7OZOMaoVhZLN3+9MglvL1EXIOjJc=
X-Received: by 2002:a0c:ead1:: with SMTP id y17mr21437572qvp.210.1579099561838; 
 Wed, 15 Jan 2020 06:46:01 -0800 (PST)
MIME-Version: 1.0
References: <20200109145333.12260-1-benjamin.gaignard@st.com>
 <20200109145333.12260-2-benjamin.gaignard@st.com>
 <20200115143521.GA15099@bogus>
In-Reply-To: <20200115143521.GA15099@bogus>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Wed, 15 Jan 2020 15:45:51 +0100
Message-ID: <CA+M3ks7FGZ9TMO0=yXrhZph1Cn1GQ+2-tM7SnDrRDXVoCjrTjA@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 pascal paillet <p.paillet@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: timer: Add STM32 Low
	Power Timer bindings
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

TGUgbWVyLiAxNSBqYW52LiAyMDIwIMOgIDE1OjM1LCBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPiBhIMOpY3JpdCA6Cj4KPiBPbiBUaHUsIEphbiAwOSwgMjAyMCBhdCAwMzo1MzozMVBNICsw
MTAwLCBCZW5qYW1pbiBHYWlnbmFyZCB3cm90ZToKPiA+IERvY3VtZW50IFNUTTMyIExvdyBQb3dl
ciBiaW5kaW5ncy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVu
amFtaW4uZ2FpZ25hcmRAc3QuY29tPgo+ID4gLS0tCj4gPiAgLi4uL2JpbmRpbmdzL3RpbWVyL3N0
LHN0bTMyLWxwLXRpbWVyLnlhbWwgICAgICAgICAgfCA0NCArKysrKysrKysrKysrKysrKysrKysr
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3N0LHN0bTMyLWxw
LXRpbWVyLnlhbWwKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3RpbWVyL3N0LHN0bTMyLWxwLXRpbWVyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdGltZXIvc3Qsc3RtMzItbHAtdGltZXIueWFtbAo+ID4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uY2EwNDBiOTZkYzQ3Cj4gPiAt
LS0gL2Rldi9udWxsCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
dGltZXIvc3Qsc3RtMzItbHAtdGltZXIueWFtbAo+Cj4gVXNlIHRoZSBjb21wYXRpYmxlIGZvciB0
aGUgZmlsZW5hbWUuCgppdCB3aWxsIGJlIGluIHYyCgo+Cj4gPiBAQCAtMCwwICsxLDQ0IEBACj4g
PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1
c2UpCj4gPiArJVlBTUwgMS4yCj4gPiArLS0tCj4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvc2NoZW1hcy90aW1lci9zdCxzdG0zMi1scC10aW1lci55YW1sIwo+ID4gKyRzY2hlbWE6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ID4gKwo+ID4gK3Rp
dGxlOiBTVE1pY3JvZWxlY3Ryb25pY3MgU1RNMzIgTG93IFBvd2VyIDE2IGJpdHMgdGltZXJzIGJp
bmRpbmdzCj4gPiArCj4gPiArbWFpbnRhaW5lcnM6Cj4gPiArICAtIEJlbmphbWluIEdhaWduYXJk
IDxiZW5qYW1pbi5nYWlnbmFyZEBzdC5jb20+Cj4gPiArCj4gPiArcHJvcGVydGllczoKPiA+ICsg
IGNvbXBhdGlibGU6Cj4gPiArICAgIGNvbnN0OiBzdCxzdG0zMi1scHRpbWVyLWNsa2V2ZW50Cj4K
PiAnY2xrZXZlbnQnIGlzIGEgaC93IG5hbWU/IFNlZW1zIHJlZHVuZGFudCBhbmQgYWJ1c2luZyBj
b21wYXRpYmxlIHRvCj4gYmluZCB0byBhIHNwZWNpZmljIExpbnV4IGRyaXZlci4KCk5vIGJ1dCBz
dCxzdG0zMi1scHRpbWVyIGNvbXBhdGlibGUgaXMgYWxyZWFkeSB1c2VkIGZvciBhbm90aGVyIGRy
aXZlcgpUaGUgaGFyZHdhcmUgYmxvY2sgY2FuIGltcGxlbWVudCBtdWx0aXBsZSBmZWF0dXJlcyBi
dXQgbm90IGFsbCBhdCB0aGUgc2FtZSB0aW1lCnNvIEkgdHJ5IHRvIGRpc3Rpbmd1aXNoIHRoZW0g
d2l0aCB0aGUgY29tcGF0aWJsZS4KSW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UgSSB3b3VsZCBsaWtl
IHRhZyBpdCBhcyBhIGNsb2NrIGV2ZW50IGRyaXZlci4KCj4KPiA+ICsKPiA+ICsgIHJlZzoKPiA+
ICsgICAgbWF4SXRlbXM6IDEKPiA+ICsKPiA+ICsgIGludGVycnVwdHM6Cj4gPiArICAgIG1heEl0
ZW1zOiAxCj4gPiArCj4gPiArICBjbG9ja3M6Cj4gPiArICAgIG1heEl0ZW1zOiAxCj4gPiArCj4g
PiArcmVxdWlyZWQ6Cj4gPiArICAtIGNvbXBhdGlibGUKPiA+ICsgIC0gcmVnCj4gPiArICAtIGlu
dGVycnVwdHMKPiA+ICsgIC0gY2xvY2tzCj4gPiArCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6
IGZhbHNlCj4gPiArCj4gPiArZXhhbXBsZXM6Cj4gPiArICAtIHwKPiA+ICsgICAgI2luY2x1ZGUg
PGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4KPiA+ICsgICAgI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3N0bTMybXAxLWNsa3MuaD4KPiA+ICsgICAgY2xrZXZl
bnQ6IGNsa2V2ZW50QDQwMDA5MDAwIHsKPgo+IHRpbWVyQC4uLgoKT0sKCj4KPiA+ICsgICAgICBj
b21wYXRpYmxlID0gInN0LHN0bTMyLWxwdGltZXItY2xrZXZlbnQiOwo+ID4gKyAgICAgIHJlZyA9
IDwweDQwMDA5MDAwIDB4NDAwPjsKPiA+ICsgICAgICBjbG9ja3MgPSA8JnJjYyBMUFRJTTFfSz47
Cj4gPiArICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDkzIElSUV9UWVBFX0xFVkVMX0hJR0g+
Owo+ID4gKyAgICB9Owo+ID4gKwo+ID4gKy4uLgo+ID4gLS0KPiA+IDIuMTUuMAo+ID4KPgo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtYXJt
LWtlcm5lbCBtYWlsaW5nIGxpc3QKPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFy
bS1rZXJuZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
