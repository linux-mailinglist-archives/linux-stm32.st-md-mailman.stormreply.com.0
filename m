Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AC04D18C
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2019 17:05:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 226A7C08559
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2019 15:05:45 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C122C640FA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2019 15:05:44 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id i34so3494215qta.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2019 08:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+SlWqt7mGdvs9AkWDoKN464Wi1itv44/ucax1MjY5Lc=;
 b=sy2yUH85O64yGVV1H0EJrjQcDOaj/CH5ejtqXd/eWKCNUQyDKLJ4Ox5EJnSlDquSXm
 SD8EasjV3UB1B5KBD4BJnBVokm+WRQoyVw89nAbRcPXDVbtLQlWLKqGtZ4VKNAIE+OPn
 oZDLcU3qBcF0A3LMaG/5XdlCcXF5Ba2qpye539vqcAVjLvl5CfKX5ey0UqOToFh2swiE
 KiXL6zKImj1xSO+JXDDiNFj4/bXj9QiS8Gf2Eh6SuPs3Z0YBFOxUIaJEAo/rbguyBbq8
 GaZJroCvZZk8cxlYXqtTx9MgwqhC9iVzV2T8mO6IRsQWKuNSzTapj4JuUQRDWb+n1Tdy
 W3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+SlWqt7mGdvs9AkWDoKN464Wi1itv44/ucax1MjY5Lc=;
 b=HNx1r12adodgHj0USjcwmD14Mz4IHz12YGEjhh3xDNSLovoIlEpSZ5cSBULUxUJmF1
 ViPlh504AUaRLUfXmrPKAePN3kJ3LGehVoz4KN+j1RAtf4fG1pknot11fbSkIGdZuk8n
 qhsEUSpsSXWbR1Z6oRnyDh5QSOY0R+y9xNArvzHpgfB570LQuLmUOHTFFAXxk0XffrFo
 jI1qkQJojKg0szc7nXlOIVdth/oP8S8LblCU336fIQ/vlf09eHQ1g4Dj1PZmH+wUc+mr
 LkCojgLGlxHdNqKrHVxL3dagGS9Tht47P3Cwb+EYCc8vCufhQU5H+UV27d1C4v69NIwq
 0aCg==
X-Gm-Message-State: APjAAAWj4CKI9asq60ATFh0P3FlN9TcjRscgFuE6LvYo62nCt/1E6Qej
 miCFQpXJiqzy6CsDFBrBBfNtC0DOou98ULQhAUMPMg==
X-Google-Smtp-Source: APXvYqwM0WwCghbi2ShrGdjVLvsTAcFo9iwOmgfOosK9RkDv6TnpEiQTqBaPRpsQc4gKzVQlXZXbkX5AW0qYeR6z2PE=
X-Received: by 2002:ac8:395b:: with SMTP id
 t27mr115053664qtb.115.1561043142986; 
 Thu, 20 Jun 2019 08:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <1560755897-5002-1-git-send-email-yannick.fertre@st.com>
 <7e6a87b6-e442-20cb-0d4e-68eb40c56042@st.com>
In-Reply-To: <7e6a87b6-e442-20cb-0d4e-68eb40c56042@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 20 Jun 2019 17:05:32 +0200
Message-ID: <CA+M3ks7oNuNnH+0eD5TDLFR_0fFWYA4gGtf40HcbFK4SQ7O-EQ@mail.gmail.com>
To: Philippe CORNU <philippe.cornu@st.com>
Cc: Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Vincent ABRIOU <vincent.abriou@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/3] drm/stm: drv: fix suspend/resume
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

TGUgbWFyLiAxOCBqdWluIDIwMTkgw6AgMTE6NTcsIFBoaWxpcHBlIENPUk5VIDxwaGlsaXBwZS5j
b3JudUBzdC5jb20+IGEgw6ljcml0IDoKPgo+IEhpIFlhbm5pY2ssCj4KPiBUaGFuayB5b3UgZm9y
IHlvdXIgcGF0Y2guCj4KPiBBY2tlZC1ieTogUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51
QHN0LmNvbT4KCkkgaGF2ZSBjb3JyZWN0ZWQgRml4ZXMgc2hhMSAoc2hvdWxkIGJlIDEyIGRpZ2l0
cykKQXBwbGllZCBvbiBkcm0tbWlzYy1uZXh0LgoKQmVuamFtaW4KCj4KPiBQaGlsaXBwZSA6LSkK
Pgo+IE9uIDYvMTcvMTkgOToxOCBBTSwgWWFubmljayBGZXJ0csOpIHdyb3RlOgo+ID4gV2l0aG91
dCB0aGlzIGZpeCwgdGhlIHN5c3RlbSBjYW4gbm90IGdvIGluICJzdXNwZW5kIiBtb2RlCj4gPiBk
dWUgdG8gYW4gZXJyb3IgaW4gZHJ2X3N1c3BlbmQgZnVuY3Rpb24uCj4gPgo+ID4gRml4ZXM6IDM1
YWI2Y2YgKCJkcm0vc3RtOiBzdXBwb3J0IHJ1bnRpbWUgcG93ZXIgbWFuYWdlbWVudCIpCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5jb20+
Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYuYyB8IDE1ICsrKysrKysrLS0t
LS0tLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jIGIvZHJpdmVy
cy9ncHUvZHJtL3N0bS9kcnYuYwo+ID4gaW5kZXggNTY1OTU3Mi4uOWRlZTRlNCAxMDA2NDQKPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHJ2LmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9zdG0vZHJ2LmMKPiA+IEBAIC0xMzYsOCArMTM2LDcgQEAgc3RhdGljIF9fbWF5YmVfdW51c2Vk
IGludCBkcnZfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiAgICAgICBzdHJ1Y3QgbHRk
Y19kZXZpY2UgKmxkZXYgPSBkZGV2LT5kZXZfcHJpdmF0ZTsKPiA+ICAgICAgIHN0cnVjdCBkcm1f
YXRvbWljX3N0YXRlICpzdGF0ZTsKPiA+Cj4gPiAtICAgICBpZiAoV0FSTl9PTighbGRldi0+c3Vz
cGVuZF9zdGF0ZSkpCj4gPiAtICAgICAgICAgICAgIHJldHVybiAtRU5PRU5UOwo+ID4gKyAgICAg
V0FSTl9PTihsZGV2LT5zdXNwZW5kX3N0YXRlKTsKPiA+Cj4gPiAgICAgICBzdGF0ZSA9IGRybV9h
dG9taWNfaGVscGVyX3N1c3BlbmQoZGRldik7Cj4gPiAgICAgICBpZiAoSVNfRVJSKHN0YXRlKSkK
PiA+IEBAIC0xNTUsMTUgKzE1NCwxNyBAQCBzdGF0aWMgX19tYXliZV91bnVzZWQgaW50IGRydl9y
ZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQo+ID4gICAgICAgc3RydWN0IGx0ZGNfZGV2aWNlICps
ZGV2ID0gZGRldi0+ZGV2X3ByaXZhdGU7Cj4gPiAgICAgICBpbnQgcmV0Owo+ID4KPiA+ICsgICAg
IGlmIChXQVJOX09OKCFsZGV2LT5zdXNwZW5kX3N0YXRlKSkKPiA+ICsgICAgICAgICAgICAgcmV0
dXJuIC1FTk9FTlQ7Cj4gPiArCj4gPiAgICAgICBwbV9ydW50aW1lX2ZvcmNlX3Jlc3VtZShkZXYp
Owo+ID4gICAgICAgcmV0ID0gZHJtX2F0b21pY19oZWxwZXJfcmVzdW1lKGRkZXYsIGxkZXYtPnN1
c3BlbmRfc3RhdGUpOwo+ID4gLSAgICAgaWYgKHJldCkgewo+ID4gKyAgICAgaWYgKHJldCkKPiA+
ICAgICAgICAgICAgICAgcG1fcnVudGltZV9mb3JjZV9zdXNwZW5kKGRldik7Cj4gPiAtICAgICAg
ICAgICAgIGxkZXYtPnN1c3BlbmRfc3RhdGUgPSBOVUxMOwo+ID4gLSAgICAgICAgICAgICByZXR1
cm4gcmV0Owo+ID4gLSAgICAgfQo+ID4KPiA+IC0gICAgIHJldHVybiAwOwo+ID4gKyAgICAgbGRl
di0+c3VzcGVuZF9zdGF0ZSA9IE5VTEw7Cj4gPiArCj4gPiArICAgICByZXR1cm4gcmV0Owo+ID4g
ICB9Cj4gPgo+ID4gICBzdGF0aWMgX19tYXliZV91bnVzZWQgaW50IGRydl9ydW50aW1lX3N1c3Bl
bmQoc3RydWN0IGRldmljZSAqZGV2KQo+ID4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
