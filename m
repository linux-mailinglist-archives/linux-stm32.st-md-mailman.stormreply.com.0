Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOLMFl4ZsWn6qgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 08:27:26 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBE625DC58
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 08:27:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8861FC9008C;
	Wed, 11 Mar 2026 07:27:25 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BF38C0693D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 09:33:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0149D600C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 09:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C77D3C2BCB3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 09:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773135192;
 bh=iJrlNVsjh6+70Ec05z6rXG0svXgiagQ0oIi5LjzykKg=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=KE80/p/KUIZZ0m7i/OIN43aBTaEeymRBmw0M6WAtsm4CddJyu6nn4tSPfT2/7FiBZ
 VFPj8QNK4E02O7q/2/SlWu33xsm7/CFxdA6fI9rFAD095OwGBGSlkjkTfoMcEmd7Oh
 Yl2fKpC5Z67Zc6JouVMQaZUCgUZapXYbhdS5Fan+jT3GEnIjNyt2buK2SVTsHoPEFn
 P+DAd3fSZ+QFLK+kxmiFqv+fly1pMLuv2BUxWPX7HNWkvV43CkBu8OydVQ4BzbABKI
 bg47oniWxm1db2FiSb2qkr7aEziiA2m5wvfkxwhK9M17HDyMiIa++d+pBaMU8VZWWp
 B8GXp3pFeOn/Q==
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-38a2f196cbaso53606001fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 02:33:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVe55VcS29QlDVhtsbt1jLFs4kc+tdBKTfwks9pslHFWFMt/GW8HyyGEUJofTBFr9/DWpQHY5md8WHFPQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwAFInwCkHrqhZHcfNRK/+pe6sTiQhAR+FqeYVyDoKDpzpDgO1j
 z8W9Bn5wK32ADDxUlixPEy4LLhI1oHqiL+BnaJoVjr7STKXzzBCwdQM8GxRWNFNlUxxhiRKV3Sx
 KwnKxwjM0t+zwDJLbrOU8PUj6RUBdhmc=
X-Received: by 2002:a2e:bd82:0:b0:387:20:bdbc with SMTP id
 38308e7fff4ca-38a40d61d78mr46199441fa.12.1773135191017; 
 Tue, 10 Mar 2026 02:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
 <20260310075539.11701-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260310075539.11701-4-wsa+renesas@sang-engineering.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Mar 2026 17:32:56 +0800
X-Gmail-Original-Message-ID: <CAGb2v65gV+2xZDO7h9Dsx=iOHX6Jt_JyHTOeWRYaEMuC+jR1FA@mail.gmail.com>
X-Gm-Features: AaiRm51CffgMBtgWhMZCUpMdeeAdI463XBf8sQip2RO0V2c7exzECk92c7gy0OY
Message-ID: <CAGb2v65gV+2xZDO7h9Dsx=iOHX6Jt_JyHTOeWRYaEMuC+jR1FA@mail.gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailman-Approved-At: Wed, 11 Mar 2026 07:27:23 +0000
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
Subject: Re: [Linux-stm32] [PATCH v4 03/15] hwspinlock: add helpers to
	retrieve core data
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
X-Rspamd-Queue-Id: 0DBE625DC58
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:mcoquelin.stm32@gmail.com,m:samuel@sholland.org,m:zhang.lyra@gmail.com,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jernej.skrabec@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:wilken.gottwalt@posteo.net,m:baolin.wang@linux.alibaba.com,m:linux-arm-msm@vger.kernel.org,m:orsonzhai@gmail.com,m:linux-omap@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:wsa@sang-engineering.com,m:mcoquelinstm32@gmail.com,m:zhanglyra@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,sholland.org,kernel.org,vger.kernel.org,posteo.net,linux.alibaba.com,lists.linux.dev,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[wens@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sang-engineering.com:email]
X-Rspamd-Action: no action

T24gVHVlLCBNYXIgMTAsIDIwMjYgYXQgMzo1NuKAr1BNIFdvbGZyYW0gU2FuZwo8d3NhK3JlbmVz
YXNAc2FuZy1lbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+Cj4gVGhpcyBpcyBhIGZpcnN0IHN0ZXAg
dG8gaGlkZSBpbnRlcm5hbCBjb3JlIHN0cnVjdHMgZnJvbSBod3NwaW5sb2NrCj4gcHJvdmlkZXJz
LiBJdCBhZGRzIGhlbHBlciBmdW5jdGlvbnMgdG8gcmV0cmlldmUgdGhlIGRhdGEgbmVlZGVkIGJ5
IHRoZW0uCj4gQmVjYXVzZSBhbGwgdXNlcnMgYXJlIG9ubHkgd2l0aGluIHRoZSBod3NwaW5sb2Nr
IHN1YnN5c3RlbSBhbmQgdGhlCj4gY2hhbmdlIHRoZXJlIGlzIHRyaXZpYWwsIGNvbnZlcnNpb24g
aXMgaW5jbHVkZWQgaW4gdGhpcyBwYXRjaCBhcyB3ZWxsLgo+Cj4gU2lnbmVkLW9mZi1ieTogV29s
ZnJhbSBTYW5nIDx3c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbT4KPiAtLS0KPiAgZHJp
dmVycy9od3NwaW5sb2NrL2h3c3BpbmxvY2tfY29yZS5jICB8IDEyICsrKysrKysrKysrKwo+ICBk
cml2ZXJzL2h3c3BpbmxvY2svb21hcF9od3NwaW5sb2NrLmMgIHwgIDQgKystLQo+ICBkcml2ZXJz
L2h3c3BpbmxvY2svcWNvbV9od3NwaW5sb2NrLmMgIHwgMTEgKysrKysrLS0tLS0KPiAgZHJpdmVy
cy9od3NwaW5sb2NrL3NwcmRfaHdzcGlubG9jay5jICB8ICA2ICsrKy0tLQo+ICBkcml2ZXJzL2h3
c3BpbmxvY2svc3RtMzJfaHdzcGlubG9jay5jIHwgIDQgKystLQoKPiAgZHJpdmVycy9od3NwaW5s
b2NrL3N1bjZpX2h3c3BpbmxvY2suYyB8ICA0ICsrLS0KCkFja2VkLWJ5OiBDaGVuLVl1IFRzYWkg
PHdlbnNAa2VybmVsLm9yZz4gIyBzdW42aQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
