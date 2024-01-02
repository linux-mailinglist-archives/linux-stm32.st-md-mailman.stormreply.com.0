Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED70822288
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jan 2024 21:27:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA41EC6DD69;
	Tue,  2 Jan 2024 20:27:33 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F327CC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jan 2024 20:27:32 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-5e6c8b70766so82003857b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Jan 2024 12:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704227252; x=1704832052;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=57elgdniwVdc3+g3xt51kmk/wTKPZc8YGaxaPGZRMwk=;
 b=NIs6pTr+IVbk5orgChLvFTWpBly4SgbQ50gAWq8jYfJl9BNWcWbk2xguj3a9CbBMnr
 Hl5b5fycL01EySFs/5akKoqvclvtS1MRarZ6kLsEZhFkWP/9spXgKFpSQAFax980wlxb
 X82CzOC2tyo4DlO22I6XpfPXQDyPRMIXWXBDaYFs3EwuxPC04+J/EG+8s71Wb0fBRboC
 zTxAklpKYuenhJBhWiSuT+sro1jNVhA7J6kKcZ/CKArJFQW9tdKf62XeYf/daIwcz7J8
 4g2UJHS0Hcdg71zoiO5Cq9DNt6GvLsVmMH8HvKzkeb99NeNAuAqwWDUMOp0trbzP0n9m
 HLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704227252; x=1704832052;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=57elgdniwVdc3+g3xt51kmk/wTKPZc8YGaxaPGZRMwk=;
 b=ERRuKYxXS8uab0jmSJG/WRAAPrT7JrMC5ZgCTo5Uq3+xXZve4ZnktzqYI1YGrGn+jH
 KGvxoyIKODCAcM+mpM46cF5c0eAbIanEp2iysls2S13xdlFYV/wMVkMyDTU5dgc9F6N5
 eL4cnP+hoSLwiCY823ZIUrlf+5QZnSgRvUowaF49m+Z/7YSmi2DIprO9eqAQFJreeCEk
 1N7xL5yWqmaRd+PiyHikYAJYmDGcN/qm0Oihj7OMJUZBuHxqRlL7GlREJRv4M5yh4tp/
 9xReeGLCd3YnwceVmMYWl4fmg/2ZDQiap5f+TFsKrS7R/6Hjm95zTaIpOL4xkSIS08ET
 lV4A==
X-Gm-Message-State: AOJu0YyVius25IdgHE41QCuDeHzpK19JuEFRqt80cbILzASCu+jAIKyQ
 h8AvwfXj6RmH2+0BE9n8BV1+Cm3gxdLOwNg6AyRi03NarAVg6g==
X-Google-Smtp-Source: AGHT+IHp2RSa0VuvVG8Klk0YQDjmzxq+0RHbKjArLq+EvbeQ8IFgiQjcRQG4mPxnAXnuBN5nttuR970iOInU5esWrKM=
X-Received: by 2002:a81:ae62:0:b0:5ea:5340:fb1d with SMTP id
 g34-20020a81ae62000000b005ea5340fb1dmr8848683ywk.53.1704227251901; Tue, 02
 Jan 2024 12:27:31 -0800 (PST)
MIME-Version: 1.0
References: <20240102162718.268271-1-romain.gantois@bootlin.com>
 <20240102162718.268271-2-romain.gantois@bootlin.com>
In-Reply-To: <20240102162718.268271-2-romain.gantois@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Jan 2024 21:27:20 +0100
Message-ID: <CACRpkdZjOBpD6HoobgMBA27dS+uz5pqb8otL+fGtMvsywYBTPA@mail.gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Richard Tresidder <rtresidd@electromag.com.au>, netdev@vger.kernel.org,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 1/1] net: stmmac: Prevent DSA tags
 from breaking COE on stmmac
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

SGkgUm9tYWluLAoKb3ZlcmFsbCB0aGlzIHBhdGNoIG1ha2VzIHNlbnNlLgoKT24gVHVlLCBKYW4g
MiwgMjAyNCBhdCA1OjI34oCvUE0gUm9tYWluIEdhbnRvaXMKPHJvbWFpbi5nYW50b2lzQGJvb3Rs
aW4uY29tPiB3cm90ZToKCj4gU29tZSBEU0EgdGFnZ2luZyBwcm90b2NvbHMgY2hhbmdlIHRoZSBF
dGhlclR5cGUgZmllbGQgaW4gdGhlIE1BQyBoZWFkZXIKPiBlLmcuICBEU0FfVEFHX1BST1RPXyhE
U0EvRURTQS9CUkNNL01USy9SVEw0Q19BL1NKQTExMDUpLiBPbiBUWCB0aGVzZSB0YWdnZWQKPiBm
cmFtZXMgYXJlIGlnbm9yZWQgYnkgdGhlIGNoZWNrc3VtIG9mZmxvYWQgZW5naW5lIGFuZCBJUCBo
ZWFkZXIgY2hlY2tlciBvZgo+IHNvbWUgc3RtbWFjIGNvcmVzLgo+Cj4gT24gUlgsIHRoZSBzdG1t
YWMgZHJpdmVyIHdyb25nbHkgYXNzdW1lcyB0aGF0IGNoZWNrc3VtcyBoYXZlIGJlZW4gY29tcHV0
ZWQKPiBmb3IgdGhlc2UgdGFnZ2VkIHBhY2tldHMsIGFuZCBzZXRzIENIRUNLU1VNX1VOTkVDRVNT
QVJZLgo+Cj4gQWRkIGFuIGFkZGl0aW9uYWwgY2hlY2sgaW4gdGhlIHN0bW1hYyB0eCBhbmQgcngg
aG90cGF0aHMgc28gdGhhdCBDT0UgaXMKPiBkZWFjdGl2YXRlZCBmb3IgcGFja2V0cyB3aXRoIGV0
aGVydHlwZXMgdGhhdCB3aWxsIG5vdCB0cmlnZ2VyIHRoZSBDT0UgYW5kCj4gaXAgaGVhZGVyIGNo
ZWNrcy4KPgo+IEZpeGVzOiA2YjJjNmU0YTkzOGYgKCJuZXQ6IHN0bW1hYzogcHJvcGFnYXRlIGZl
YXR1cmUgZmxhZ3MgdG8gdmxhbiIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBSZXBv
cnRlZC1ieTogUmljaGFyZCBUcmVzaWRkZXIgPHJ0cmVzaWRkQGVsZWN0cm9tYWcuY29tLmF1Pgo+
IENsb3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2L2U1YzZjNzVmLTJkZmEtNGU1
MC1hMWZiLTZiZjRjZGI2MTdjMkBlbGVjdHJvbWFnLmNvbS5hdS8KPiBSZXBvcnRlZC1ieTogUm9t
YWluIEdhbnRvaXMgPHJvbWFpbi5nYW50b2lzQGJvb3RsaW4uY29tPgo+IENsb3NlczogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2L2M1NzI4M2VkLTZiOWItYjBlNi1lZTEyLTU2NTVjMWM1
NDQ5NUBib290bGluLmNvbS8KPiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gR2FudG9pcyA8cm9tYWlu
LmdhbnRvaXNAYm9vdGxpbi5jb20+CiguLi4pCgo+ICtzdGF0aWMgaW5saW5lIGJvb2wgc3RtbWFj
X2hhc19pcF9ldGhlcnR5cGUoc3RydWN0IHNrX2J1ZmYgKnNrYikKPiArewo+ICsgICAgICAgX19i
ZTE2IHByb3RvID0gZXRoX2hlYWRlcl9wYXJzZV9wcm90b2NvbChza2IpOwoKSSBtYWRlIGEgbmV3
IGZ1bmN0aW9uIGZvciB0aGlzIGluIG15IHBhdGNoCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL25l
dGRldi8yMDIzMTIyMi1uZXctZ2VtaW5pLWV0aGVybmV0LXJlZ3Jlc3Npb24tdjQtMi1hMzZlNzFi
MGYzMmJAbGluYXJvLm9yZy8KCkkgd2FzIGNhcmVmdWwgdG8gYWRkIGlmICghcHNrYl9tYXlfcHVs
bChza2IsIEVUSF9ITEVOKSkgYmVjYXVzZSBFcmljCndhcyB2ZXJ5IHNwZWNpZmljIGFib3V0IHRo
aXMsIEkgc3VwcG9zZSB5b3UgY291bGQgZ2V0IGZyYWdtZW50IGZyYW1lcyB0aGF0CmFyZSBzbWFs
bGVyIHRoYW4gYW4gZXRoZXJuZXQgaGVhZGVyLgoKSSBzaG91bGQgdXNlIGV0aF9oZWFkZXJfcGFy
c2VfcHJvdG9jb2woKSBpbnN0ZWFkIG9mIHJlaW1wbGVtZW50aW5nIGl0CnRob3VnaC4gOi8KClNo
b3VsZCB3ZSBhZGQgYW4gaWYgKCFwc2tiX21heV9wdWxsKHNrYiwgRVRIX0hMRU4pKSB0bwpldGhf
aGVhZGVyX3BhcnNlX3Byb3RvY29sKCk/CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
