Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6962F16421D
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Feb 2020 11:29:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3359BC36B0B;
	Wed, 19 Feb 2020 10:29:38 +0000 (UTC)
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87826C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Feb 2020 10:29:36 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id r18so15072565vso.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Feb 2020 02:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=N/FWsOslLeWJ8wc9PPiLEWzxti0Lz4tyLMKB84GK8Qg=;
 b=zzcA9hwk8oBqEzK/Sk5smaykWWWhkqLgdN2ggNaL0cspzNwa1q+GoinNOOoh2h9V51
 Lv7ZUcQx+nj4ydcgo+MumePOIXyd+adldZYvoZGHUzMACLER4enSZC94mRb28MJr6c1A
 J0zDWaHD7YQ525Kl6Y1gatEtQ406L9F6WgmgJkakqPk8Q+C9ZZgLDbcn0PVAxkoeaFBp
 u1Zh99N7KbfqvYQDnfJFNmIip0HZ15FT2UcLc3U/w813BeSgu1q8swKVqPbRLuHM9XJ3
 Uxz065dq2yY9KSl+injyEt5q+2tCcO4d067fxfYm7S/GKS+XZflxxlWeTWxnoNcErJqI
 wpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=N/FWsOslLeWJ8wc9PPiLEWzxti0Lz4tyLMKB84GK8Qg=;
 b=tCStNKeBRfzU/bpNOGqzgPrKNFWpU0R5Zw6YjphJAmDAzjdnDiqJOcyQ4HFpsV6XF/
 XNU0AMW/NvERmFPAgvF4sbhMuMPrvGr56m/K5Q9y914Qbyc6Y6sUgvqMWUyhGvgNxNsj
 yGqnunQDGlAO7DiYp68b0HINqYyRwvmkfRbbxIbrlz9biWypIRbyQm2cCzH31pt4bnLf
 eYZTj7xcKXNNyMU2BG0iQAJLCsX2pbXqXZplyC5VK4Nxp8o0PpiWmZbnsaHwpTBdnO0v
 0AJqO8H30ZLU7K6ILtFsq1dBVTabvSC6SjgYkEaH4amT/8cK51WOCP4l4SMHgW1ZlHji
 aKMg==
X-Gm-Message-State: APjAAAXSaakTJZOA3vvULVSbBmx92xW+5XHLeng8NxZBbZDzbEzB8MMQ
 /HwARJokNhsyEgy/p/CT17JJnvbn9/meqdoiUCyhKw==
X-Google-Smtp-Source: APXvYqwdd1WVvropN/Ah9GWZ4j1iP+qWglk6pATFnqpFpANspIETm+lPq1ohJHYuPnh9a1IcHgjcTAcwzRPQ36OkB7Q=
X-Received: by 2002:a67:5e45:: with SMTP id s66mr13897757vsb.200.1582108175469; 
 Wed, 19 Feb 2020 02:29:35 -0800 (PST)
MIME-Version: 1.0
References: <20200128090636.13689-1-ludovic.barre@st.com>
 <20200128090636.13689-10-ludovic.barre@st.com>
 <853f4b14-a188-f329-34e5-8e88fcafa775@st.com>
In-Reply-To: <853f4b14-a188-f329-34e5-8e88fcafa775@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 19 Feb 2020 11:28:59 +0100
Message-ID: <CAPDyKFrKunZ1nDiSR-6ZgZNxkxs=_R-i3N9QWNovnZ4iY=DP=g@mail.gmail.com>
To: Ludovic BARRE <ludovic.barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V2 9/9] mmc: mmci: add sdmmc variant
	revision 2.0
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

T24gVHVlLCAxMSBGZWIgMjAyMCBhdCAxNTo0NCwgTHVkb3ZpYyBCQVJSRSA8bHVkb3ZpYy5iYXJy
ZUBzdC5jb20+IHdyb3RlOgo+Cj4gaGkgVWxmCj4KPiBMZSAxLzI4LzIwIMOgIDEwOjA2IEFNLCBM
dWRvdmljIEJhcnJlIGEgw6ljcml0IDoKPiA+IFRoaXMgcGF0Y2ggYWRkcyBhIHNkbW1jIHZhcmlh
bnQgcmV2aXNpb24gMi4wLgo+ID4gVGhpcyByZXZpc2lvbiBpcyBiYWNrd2FyZCBjb21wYXRpYmxl
IHdpdGggMS4xLCBhbmQgYWRkcyBkbWEKPiA+IGxpbmsgbGlzdCBzdXBwb3J0Lgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IEx1ZG92aWMgQmFycmUgPGx1ZG92aWMuYmFycmVAc3QuY29tPgo+ID4gLS0t
Cj4gPiAgIGRyaXZlcnMvbW1jL2hvc3QvbW1jaS5jIHwgMzAgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspCj4gPgo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3QvbW1jaS5jIGIvZHJpdmVycy9tbWMvaG9zdC9t
bWNpLmMKPiA+IGluZGV4IDI0ZTYzMDE4M2VkNC4uYTc3NGMzMjljMjEyIDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9tbWMvaG9zdC9tbWNpLmMKPiA+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3QvbW1j
aS5jCj4gPiBAQCAtMjc1LDYgKzI3NSwzMSBAQCBzdGF0aWMgc3RydWN0IHZhcmlhbnRfZGF0YSB2
YXJpYW50X3N0bTMyX3NkbW1jID0gewo+ID4gICAgICAgLmluaXQgICAgICAgICAgICAgICAgICAg
PSBzZG1tY192YXJpYW50X2luaXQsCj4gPiAgIH07Cj4gPgo+ID4gK3N0YXRpYyBzdHJ1Y3QgdmFy
aWFudF9kYXRhIHZhcmlhbnRfc3RtMzJfc2RtbWN2MiA9IHsKPiA+ICsgICAgIC5maWZvc2l6ZSAg
ICAgICAgICAgICAgID0gMTYgKiA0LAo+ID4gKyAgICAgLmZpZm9oYWxmc2l6ZSAgICAgICAgICAg
PSA4ICogNCwKPiA+ICsgICAgIC5mX21heCAgICAgICAgICAgICAgICAgID0gMjA4MDAwMDAwLAo+
ID4gKyAgICAgLnN0bTMyX2Nsa2RpdiAgICAgICAgICAgPSB0cnVlLAo+ID4gKyAgICAgLmNtZHJl
Z19jcHNtX2VuYWJsZSAgICAgPSBNQ0lfQ1BTTV9TVE0zMl9FTkFCTEUsCj4gPiArICAgICAuY21k
cmVnX2xyc3BfY3JjICAgICAgICA9IE1DSV9DUFNNX1NUTTMyX0xSU1BfQ1JDLAo+ID4gKyAgICAg
LmNtZHJlZ19zcnNwX2NyYyAgICAgICAgPSBNQ0lfQ1BTTV9TVE0zMl9TUlNQX0NSQywKPiA+ICsg
ICAgIC5jbWRyZWdfc3JzcCAgICAgICAgICAgID0gTUNJX0NQU01fU1RNMzJfU1JTUCwKPiA+ICsg
ICAgIC5jbWRyZWdfc3RvcCAgICAgICAgICAgID0gTUNJX0NQU01fU1RNMzJfQ01EU1RPUCwKPiA+
ICsgICAgIC5kYXRhX2NtZF9lbmFibGUgICAgICAgID0gTUNJX0NQU01fU1RNMzJfQ01EVFJBTlMs
Cj4gPiArICAgICAuaXJxX3Bpb19tYXNrICAgICAgICAgICA9IE1DSV9JUlFfUElPX1NUTTMyX01B
U0ssCj4gPiArICAgICAuZGF0YWN0cmxfZmlyc3QgICAgICAgICA9IHRydWUsCj4gPiArICAgICAu
ZGF0YWNudF91c2VsZXNzICAgICAgICA9IHRydWUsCj4gPiArICAgICAuZGF0YWxlbmd0aF9iaXRz
ICAgICAgICA9IDI1LAo+ID4gKyAgICAgLmRhdGFjdHJsX2Jsb2Nrc3ogICAgICAgPSAxNCwKPiA+
ICsgICAgIC5kYXRhY3RybF9hbnlfYmxvY2tzeiAgID0gdHJ1ZSwKPiA+ICsgICAgIC5zdG0zMl9p
ZG1hYnNpemVfbWFzayAgID0gR0VOTUFTSygxNiwgNSksCj4gPiArICAgICAuZG1hX2xsaSAgICAg
ICAgICAgICAgICA9IHRydWUsCj4gPiArICAgICAuYnVzeV90aW1lb3V0ICAgICAgICAgICA9IHRy
dWUsCj4KPiBJIGZvcmdldCAiYnVzeV9kZXRlY3QgICAgICAgICAgID0gdHJ1ZSwiIHByb3BlcnR5
Cj4gSSBhZGQgdGhpcyBpbiBuZXh0IHBhdGNoIHNldAoKTm8gbmVlZCBmb3IgYSByZS1zZW5kLCBJ
IGFtZW5kZWQgdGhpcyB3aGVuIEkgYXBwbGllZCBpdC4KCj4KPiA+ICsgICAgIC5idXN5X2RldGVj
dF9mbGFnICAgICAgID0gTUNJX1NUTTMyX0JVU1lEMCwKPiA+ICsgICAgIC5idXN5X2RldGVjdF9t
YXNrICAgICAgID0gTUNJX1NUTTMyX0JVU1lEMEVORE1BU0ssCj4gPiArICAgICAuaW5pdCAgICAg
ICAgICAgICAgICAgICA9IHNkbW1jX3ZhcmlhbnRfaW5pdCwKPiA+ICt9Owo+ID4gKwo+ID4gICBz
dGF0aWMgc3RydWN0IHZhcmlhbnRfZGF0YSB2YXJpYW50X3Fjb20gPSB7Cj4gPiAgICAgICAuZmlm
b3NpemUgICAgICAgICAgICAgICA9IDE2ICogNCwKPiA+ICAgICAgIC5maWZvaGFsZnNpemUgICAg
ICAgICAgID0gOCAqIDQsCj4gPiBAQCAtMjM0Myw2ICsyMzY4LDExIEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgYW1iYV9pZCBtbWNpX2lkc1tdID0gewo+ID4gICAgICAgICAgICAgICAubWFzayAgID0g
MHhmMGZmZmZmZiwKPiA+ICAgICAgICAgICAgICAgLmRhdGEgICA9ICZ2YXJpYW50X3N0bTMyX3Nk
bW1jLAo+ID4gICAgICAgfSwKPiA+ICsgICAgIHsKPiA+ICsgICAgICAgICAgICAgLmlkICAgICA9
IDB4MDAyNTMxODAsCj4gPiArICAgICAgICAgICAgIC5tYXNrICAgPSAweGYwZmZmZmZmLAo+ID4g
KyAgICAgICAgICAgICAuZGF0YSAgID0gJnZhcmlhbnRfc3RtMzJfc2RtbWN2MiwKPiA+ICsgICAg
IH0sCj4gPiAgICAgICAvKiBRdWFsY29tbSB2YXJpYW50cyAqLwo+ID4gICAgICAgewo+ID4gICAg
ICAgICAgICAgICAuaWQgICAgID0gMHgwMDA1MTE4MCwKPiA+CgpLaW5kIHJlZ2FyZHMKVWZmZQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
