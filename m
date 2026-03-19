Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qP+1FTr1u2nkqQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 14:08:10 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C57332CBA70
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 14:08:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59FEFC87ECE;
	Thu, 19 Mar 2026 13:08:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4E6DC08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:08:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6703D44563
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C47BC2BCB1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773925686;
 bh=PLIQNmpARgORTyPtKiscw4UfX4zOOAigpCDT2JYNybY=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=PLF4kov8VHF5Sz3cCLnIzd9CB3vRVzrNjXvudGe6zNM9EioZ5xUNAjtWGfOSMaeay
 lvq+NQihEbdMoSP9Jiq1NdWLcEhKx0vpVO9lGPcLGB4pqxvKGe/Aak/3Xq2Hbbyn3I
 9uMMge3POiG3mLoH0PFauIh+4/wXlbhnx0S/DBSgx81OPUwDhJYiCaGEgaalECQ/Re
 OICBDCGhdAHSQ6zYFduWEAhPkfM9k+NCePHEqCIjsaCSJ4KY1ZfZg9lSij+ytrOd63
 9ngQGI/xbOH0TpHR2JehTFci96wF/M9JIQb0wCz3HmT4DSc2qVUwu/qiII139nm9JO
 YaZVg7FnQY3TA==
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-38a32d36396so7734941fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 06:08:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVHozSny8XZYeu4Bt+1hmlpjkO+SsoSK64vJez9DU0E5RXBZQ5wFgfDnCuKdby8VPu9PGa/difIr6PBjw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw4mcQxv+NI446apzQk5/Irzb3pG4fnHbHqG6zzCDm6nEavr5dj
 W7u6crbJ+vrXOL0YsGs1uq0RpLPffM5QWItHfWcWxKP83C0MhHJtR5dyVV+VgUra/oG61cdL0EN
 paNu2qOipvB+HAYkkedyUQA+Am9GIYKk=
X-Received: by 2002:a2e:bc20:0:b0:383:789:3c3 with SMTP id
 38308e7fff4ca-38be5e6e7ebmr10670061fa.2.1773925684481; 
 Thu, 19 Mar 2026 06:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
 <20260319105947.6237-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260319105947.6237-5-wsa+renesas@sang-engineering.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 19 Mar 2026 21:07:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v67NVc0QD=_Ftwx5LSCQ8n1cEwuX1oMWZgEzowfGf7gMKA@mail.gmail.com>
X-Gm-Features: AaiRm51rluS_yVFu6WIEO2l7ox-ygOi8igmHKgG-QVsILV0f84uRCi8SrIk-dv0
Message-ID: <CAGb2v67NVc0QD=_Ftwx5LSCQ8n1cEwuX1oMWZgEzowfGf7gMKA@mail.gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun@kernel.org>, linux-remoteproc@vger.kernel.org,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Corbet <corbet@lwn.net>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, Wilken Gottwalt <wilken.gottwalt@posteo.net>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Orson Zhai <orsonzhai@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v5 04/15] hwspinlock: add callback to fill
 private data of a hwspinlock
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:linux-doc@vger.kernel.org,m:peterz@infradead.org,m:boqun@kernel.org,m:linux-remoteproc@vger.kernel.org,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:corbet@lwn.net,m:zhang.lyra@gmail.com,m:jernej.skrabec@gmail.com,m:mingo@redhat.com,m:longman@redhat.com,m:linux-sunxi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:wilken.gottwalt@posteo.net,m:baolin.wang@linux.alibaba.com,m:skhan@linuxfoundation.org,m:linux-omap@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:orsonzhai@gmail.com,m:andersson@kernel.org,m:samuel@sholland.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:wsa@sang-engineering.com,m:zhanglyra@gmail.com,m:jernejskrabec@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[wens@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,infradead.org,kernel.org,st-md-mailman.stormreply.com,lwn.net,gmail.com,redhat.com,lists.linux.dev,posteo.net,linux.alibaba.com,linuxfoundation.org,lists.infradead.org,sholland.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_SPAM(0.00)[0.694];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: C57332CBA70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVGh1LCBNYXIgMTksIDIwMjYgYXQgNzowMOKAr1BNIFdvbGZyYW0gU2FuZwo8d3NhK3JlbmVz
YXNAc2FuZy1lbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+Cj4gVG8gaGlkZSBpbnRlcm5hbCBjb3Jl
IHN0cnVjdHVyZXMgZnJvbSBwcm92aWRlcnMsIGEgY2FsbGJhY2sgaXMgYWRkZWQgdG8KPiB0aGUg
b3BzIHdoaWNoIGFsbG93cyB0byBzZXQgdGhlICdwcml2JyBmaWVsZCBvZiBhIGh3c3BpbmxvY2su
IEl0IGlzCj4gY2FsbGVkIHdoZW4gYSBod3NwaW5sb2NrIGRldmljZSBpcyByZWdpc3RlcmVkIGFu
ZCwgdGh1cywgaXRlcmF0ZWQgb3Zlcgo+IGFsbCBsb2Nrcy4gVGhlIHJlZ2lzdGVyLWZ1bmN0aW9u
cyBhcmUgYWxzbyBleHRlbmRlZCB0byBwYXNzIGEgZGF0YQo+IHBvaW50ZXIgdG8gdGhpcyBjYWxs
YmFjaywgc28gaXQgY2FuIGRvIG5lY2Vzc2FyeSBjYWxjdWxhdGlvbnMgZm9yIHRoZQo+IHByaXYg
ZmllbGQgb2YgZWFjaCBod3NwaW5sb2NrLiBQcm92aWRlcnMgYXJlIGFkZGVkIG9ubHkgYW4gZW1w
dHkKPiBwbGFjZWhvbGRlciBhbmQgYXJlIGNvbnZlcnRlZCBzZXBhcmF0ZWx5IGJlY2F1c2UgdGhl
c2UgY2hhbmdlcyBuZWVkCj4gZGVkaWNhdGVkIHJldmlld3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBX
b2xmcmFtIFNhbmcgPHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29tPgo+IC0tLQo+ICBE
b2N1bWVudGF0aW9uL2xvY2tpbmcvaHdzcGlubG9jay5yc3QgICAgIHwgIDMgKystCj4gIGRyaXZl
cnMvaHdzcGlubG9jay9od3NwaW5sb2NrX2NvcmUuYyAgICAgfCAxOSArKysrKysrKysrKysrKyst
LS0tCj4gIGRyaXZlcnMvaHdzcGlubG9jay9od3NwaW5sb2NrX2ludGVybmFsLmggfCAxOSArKysr
KysrKysrKy0tLS0tLS0tCj4gIGRyaXZlcnMvaHdzcGlubG9jay9vbWFwX2h3c3BpbmxvY2suYyAg
ICAgfCAgMiArLQo+ICBkcml2ZXJzL2h3c3BpbmxvY2svcWNvbV9od3NwaW5sb2NrLmMgICAgIHwg
IDIgKy0KPiAgZHJpdmVycy9od3NwaW5sb2NrL3NwcmRfaHdzcGlubG9jay5jICAgICB8ICAyICst
Cj4gIGRyaXZlcnMvaHdzcGlubG9jay9zdG0zMl9od3NwaW5sb2NrLmMgICAgfCAgMiArLQo+ICBk
cml2ZXJzL2h3c3BpbmxvY2svc3VuNmlfaHdzcGlubG9jay5jICAgIHwgIDIgKy0KCkFja2VkLWJ5
OiBDaGVuLVl1IFRzYWkgPHdlbnNAa2VybmVsLm9yZz4gIyBmb3Igc3VuNmkKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
