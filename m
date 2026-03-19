Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJ6sGMv1u2nkqQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 14:10:35 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 065922CBB2D
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 14:10:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C16EBC87ECE;
	Thu, 19 Mar 2026 13:10:34 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38C84C08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:10:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 47E79600AD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB589C2BCB2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773925832;
 bh=/z6FEu0IUK6nCL3Uiqn1iq1VRQstHdDNDk6ymaE5UrI=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=Bo01snnRFCsVSU9jXLHYlBSQbxAuKL8IlZztOzE7GGenHwqVix5ssfwMi9T3optQG
 d+gdZbHjid/FAQoMdnnvLy7M2K/MKgAstWlXld4NzDhgAaD4vtKGHzQIdX788cS21V
 dFWydrgXzY/v9glSzQoEPDrKsVEti1U+5GfLE/NEDAwz+HH1o3l/SSY5ICwNs7lfQE
 SgYxMuBjZ2CuTOrkXPv4s5eyPP1f6e/bZWIElN+S6x7LjeGeeI3xFgd0/YAfwDebPv
 qUmCFKkrzQXaTuT5I2A/RKhCEe1nrU8iKbsxLH3L/Inc4Pn/eW0rhPQhZNZyKFwJJv
 5fv/h7nyjmQUQ==
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5a278e0f7f6so1215035e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 06:10:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVHyDYAAB9w+8k2JVbGveXZPKJ/QgRaA4nVtnqfzFbgraxUW5wd+CoGvUpZ3hSYrHizZISh8XcqTdI94w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwuoxBAVKdQTkg+QI4AiGlsJLBfP1aSRq+nFSvMqbMFdSTYcgXh
 rg75z3tesE/WAchj67QEhCf+pXjlR7CwYwHz9CkPNISV5ZOsq7UFWOnC7TXFajDSqza8IrP0IOL
 oZAqvs6qXf89KIb2VHmCNug2+4du8MKo=
X-Received: by 2002:ac2:4303:0:b0:5a1:49a0:af35 with SMTP id
 2adb3069b0e04-5a27958560emr2184109e87.10.1773925830317; Thu, 19 Mar 2026
 06:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
 <20260319105947.6237-15-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260319105947.6237-15-wsa+renesas@sang-engineering.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 19 Mar 2026 21:10:16 +0800
X-Gmail-Original-Message-ID: <CAGb2v668mhN7XnjbA5Zg4ExRXLVqn8d9kDjap4wVNEEL780p7g@mail.gmail.com>
X-Gm-Features: AaiRm53ZA49QZnlP2rMulPZJ-bDSE_dydGwTankSFX-RnHDx5Riad08-AOxumlo
Message-ID: <CAGb2v668mhN7XnjbA5Zg4ExRXLVqn8d9kDjap4wVNEEL780p7g@mail.gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-renesas-soc@vger.kernel.org,
 Wilken Gottwalt <wilken.gottwalt@posteo.net>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-arm-msm@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, linux-omap@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 14/15] hwspinlock: refactor provider.h
	from public header
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
Reply-To: wens@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [4.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:mcoquelin.stm32@gmail.com,m:samuel@sholland.org,m:zhang.lyra@gmail.com,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jernej.skrabec@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:wilken.gottwalt@posteo.net,m:baolin.wang@linux.alibaba.com,m:linux-arm-msm@vger.kernel.org,m:orsonzhai@gmail.com,m:linux-omap@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:wsa@sang-engineering.com,m:mcoquelinstm32@gmail.com,m:zhanglyra@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,sholland.org,kernel.org,vger.kernel.org,posteo.net,linux.alibaba.com,lists.linux.dev,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[wens@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_SPAM(0.00)[0.687];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sang-engineering.com:email,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 065922CBB2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVGh1LCBNYXIgMTksIDIwMjYgYXQgNzowMOKAr1BNIFdvbGZyYW0gU2FuZwo8d3NhK3JlbmVz
YXNAc2FuZy1lbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+Cj4gRmFjdG9yIG91dCB0aGUgZW50cmll
cyBvbmx5IG5lZWRlZCBmb3IgcHJvdmlkZXJzIGZyb20gdGhlIGdlbmVyaWMgcHVibGljCj4gaGVh
ZGVyLiBUaGlzIGFsbG93cyBmb3IgYSBjbGVhbiBzZXBhcmF0aW9uIGJldHdlZW4gcHJvdmlkZXJz
IGFuZAo+IGNvbnN1bWVycy4gQWxsIHByb3ZpZGVycyBhcmUgaW4gdGhlIGh3c3BpbmxvY2sgc3Vi
c3lzdGVtIGN1cnJlbnRseSBhbmQKPiBhcmUgdHJpdmlhbGx5IGNvbnZlcnRlZCBoZXJlIGFzIHdl
bGwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBXb2xmcmFtIFNhbmcgPHdzYStyZW5lc2FzQHNhbmctZW5n
aW5lZXJpbmcuY29tPgo+IC0tLQo+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDEgKwo+ICBkcml2ZXJzL2h3c3BpbmxvY2svaHdzcGlubG9ja19jb3JlLmMgIHwgIDEg
Kwo+ICBkcml2ZXJzL2h3c3BpbmxvY2svb21hcF9od3NwaW5sb2NrLmMgIHwgIDIgKy0KPiAgZHJp
dmVycy9od3NwaW5sb2NrL3Fjb21faHdzcGlubG9jay5jICB8ICAyICstCj4gIGRyaXZlcnMvaHdz
cGlubG9jay9zcHJkX2h3c3BpbmxvY2suYyAgfCAgMiArLQo+ICBkcml2ZXJzL2h3c3BpbmxvY2sv
c3RtMzJfaHdzcGlubG9jay5jIHwgIDIgKy0KCj4gIGRyaXZlcnMvaHdzcGlubG9jay9zdW42aV9o
d3NwaW5sb2NrLmMgfCAgMiArLQoKQWNrZWQtYnk6IENoZW4tWXUgVHNhaSA8d2Vuc0BrZXJuZWwu
b3JnPiAjIGZvciBzdW42aQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
