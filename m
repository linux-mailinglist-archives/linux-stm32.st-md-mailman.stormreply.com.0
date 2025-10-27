Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A31AC119EE
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 23:10:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 174DDC6049B;
	Mon, 27 Oct 2025 22:10:24 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31904C6049A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 22:10:22 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-378cfd75fb0so55745961fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 15:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761603021; x=1762207821;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P83isQ2gvRt7wdmXJ1hdjP2SDCiz+lwtL0Vt91PBpcs=;
 b=Anu/xRJBdqmBq/yDEarvxUnFFXAJVatZsgtXtBEUEflIddpGzFKGKIF8VeQ0rsOi4n
 mnUHGgg7I8kVTkqLIt4JdfxECd3I9qULeuB1MmDVtZdTzE7SikHWez6YisOlbw83Cpyb
 IFDJE4HWXLbPb4PfVg2f9oGqD1/zI+r2YFnUDirBzy6c7LfsaeMlOEuJBgcKcnNJ60Wd
 JnwJDlQtG5LNpZxt9rE1ULVdhPkj/ZIstlV6wUKeuXtXrHBMXUcdHIc+Xbhw+tGTmW8X
 tZxM+oQjY2W0id3acPP2oG6JGma7mdiEPiLn60R/pAa/0RKie6njBAH4H5eY3ZagDvDj
 ypVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761603021; x=1762207821;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P83isQ2gvRt7wdmXJ1hdjP2SDCiz+lwtL0Vt91PBpcs=;
 b=VBv2LuNTmcr+VkYcwwBxUhKFhmYvVepNg15OCcc47ckx0LWTPGJaGJuQ8xV97/BVco
 tFPocoHRS4ixq9luuaxs/NnBYnk4sAvz02TgWk81VUXjJrBNXg206InGN4aozoFOqTKm
 DtuWEDeXccxuN65mOyeTSnTLd9pZuVdRQQnrClZpDiDiXNn4cUXnKQXtHRejkUnSzZPe
 I2hZO2Ot6EOzlRrm9CA9mnM+wR+YlkhGFLTdmgWS/GbfdBodiKupR3uM5pUIjewSllmR
 BMnUNyZTtiDn8IfZHaaLndaVlpY7b2YbC/jWAFSwy5hSO18ZAkJV9sYHPleSJNnP7B5F
 p0ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqkC5eg8fWwuCNb20+Z+sU5vYMRxA4qv1nxo3ksKJUn8SNW4oWdRgbRDaSMdmQ3VsrvxmqlFp8moWrrg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxn11bqSHh3ELXhTlvJDIuHbdEkHox/bPmPnl8n1y6SJZ3epITA
 hsU+QWi6xgQJ3Fnxp5xRs6I08px70tK8MggwJ1JcMRLsdkngBi1T33P3xS6Xpos8aMWxwRzYHLq
 s1eH/C9mpkZ4tCtggvgVb/GPwiYNPPhfNq7wnouuFGw==
X-Gm-Gg: ASbGncuYVQFcYHNY9s1y219OHhv5wnfakd7DCRqhC6a8+nv2WWL4wA21X2AeTm1BA93
 AdKKsrFVGZ7K6tr1IgGS2rzn5yt+pMTK4rUBggSPRfHiH1XhUBLnIOr8z751cZS4xoEBVL0tOSm
 2JdmmUAUZkzhLVzPA52wVtK8sdsgaU+8POpaPRUBfjUiykGDLLha6gpuf6hTMknRVrwKd2hjfKz
 kC3kcXIMx/PRs3zyz8U6d9s1Vfw1/6YWKtYHnWdVz1Gkv2/b7SIkTPG5T/mrv3ZuvuF/Lk=
X-Google-Smtp-Source: AGHT+IG9eaDbYlt05Z9zFZohfCDZwr4gqNsotaN2JZ8jVtyJSZnzH8ZzP5hqxntC1aSKIIT+xacG9uS/M37uyI9DBCI=
X-Received: by 2002:a05:651c:43c8:10b0:372:9992:1b0 with SMTP id
 38308e7fff4ca-3790774ba26mr3083561fa.31.1761603021254; Mon, 27 Oct 2025
 15:10:21 -0700 (PDT)
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
 <20251023132700.1199871-3-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-3-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:10:10 +0100
X-Gm-Features: AWmQ_bm5etBIx2qF76UfEPLiy1Nl6j4OjIJVT1wJCcuvidRKmWwIeYmy15zR_II
Message-ID: <CACRpkdbitTgbd+DcdTNYeuHMuSeMQMx5PQbZ=qsFxCPU1ZFugA@mail.gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v4 02/12] pinctrl: pinconf-generic: Handle
 string values for generic properties
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

T24gVGh1LCBPY3QgMjMsIDIwMjUgYXQgMzoyN+KAr1BNIEFudG9uaW8gQm9ybmVvCjxhbnRvbmlv
LmJvcm5lb0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IEFsbG93IGEgZ2VuZXJpYyBwaW5jb25mIHBy
b3BlcnR5IHRvIHNwZWNpZnkgaXRzIGFyZ3VtZW50IGFzIG9uZSBvZgo+IHRoZSBzdHJpbmdzIGlu
IGEgbWF0Y2ggbGlzdC4KPiBDb252ZXJ0IHRoZSBtYXRjaGluZyBzdHJpbmcgdG8gYW4gaW50ZWdl
ciB2YWx1ZSB1c2luZyB0aGUgaW5kZXggaW4KPiB0aGUgbGlzdCwgdGhlbiBrZWVwIHVzaW5nIHRo
aXMgdmFsdWUgaW4gdGhlIGdlbmVyaWMgcGluY29uZiBjb2RlLgo+Cj4gU2lnbmVkLW9mZi1ieTog
QW50b25pbyBCb3JuZW8gPGFudG9uaW8uYm9ybmVvQGZvc3Muc3QuY29tPgoKUGF0Y2ggYXBwbGll
ZCwgSSBoYWQgYSBoYXJkIHRpbWUgdG8gZm9sbG93IHRoZSBwYXRjaCBmdWxseSBhbmQgdW5zdXJl
CmlmIHdlIHNob3VsZCBhZGQgc29tZSBkb2NzIGFzIHdlbGw/IEJ1dCBsZXQncyB0b3NzIGl0IGlu
IHRoZXJlIGFuZCBzZWUKaWYgaXQgd29ya3MuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
