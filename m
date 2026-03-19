Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHp5EoP1u2nkqQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 14:09:23 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8A82CBACB
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 14:09:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BDACC87ECE;
	Thu, 19 Mar 2026 13:09:22 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40772C08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:09:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0124D44507
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C349CC4AF14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 13:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773925759;
 bh=Q6j72inhTsH6ewxfYJqIA8kdxCdrfzZ/qo9HHgaCAUs=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=Qygsp4SYDnjNIkRepZ6B/Da7WIVTVHYU4iXoNk8PmGV1OM/gGOd5/M9BvufNOMbpX
 L3fe8ghS0ZDexaf/xoBcCNoxfpzJGgcSymUOSQM8LFCm7B7oLjrOmUhDXWw83okB85
 JQKsLI1aTMKRjTk8mRQm4qDfSybEOQ/uU2kuBX7DlPaciRMwXzFDcFiQGi1TZaeY7U
 /kYnMWhOloiKv/Vxw9DHsIIOnyr5Jm2RgGOup9G6c0BG3+vMniwNt0YL5DyO74/QJY
 tvIbSDut+lE9CHg5aThsCyDdx3qXRcHu/ur7TUusVV3mLOE3vNUfEnXpdq66baJQkI
 rj9/ECGl7VWpA==
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-389f9895c81so9380971fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 06:09:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUN+j9qqJ4E1qiJutEUArX5h6bDnQNafROkDEz4ePvL8RH34uPhvHb20N36AxHQM4QIa7Jzy+0e0To76w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx1TukcQTA1VpzbQwegXR/TSvOBB5gJW9eO9mbm+LQVsQAiiF6X
 kn/CyLAD6HkvVW7w3VCCWqS4OQ9DtjOxdWj7UQ4LZQPDQtZLKPY6+cJ3aEg2e6zCBPDjrgtNOQQ
 hSKPagTLzSZe4/f+ufK1wLn/M6GC941o=
X-Received: by 2002:a05:651c:201e:b0:38a:4a27:1b58 with SMTP id
 38308e7fff4ca-38bd58700a4mr22921261fa.23.1773925758025; Thu, 19 Mar 2026
 06:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
 <20260319105947.6237-11-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260319105947.6237-11-wsa+renesas@sang-engineering.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 19 Mar 2026 21:09:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v673oGgYbK9vxtgzCNSKR0=d+yT+3tD_bp_0AwLdVbht7w@mail.gmail.com>
X-Gm-Features: AaiRm51-S2qI8OWMlxRbpEKWhlUg86es_OnJ0C138mWD9n1SBCUMxkSAhbQynxE
Message-ID: <CAGb2v673oGgYbK9vxtgzCNSKR0=d+yT+3tD_bp_0AwLdVbht7w@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v5 10/15] hwspinlock: handle hwspinlock
 device allocation in the core
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
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:linux-doc@vger.kernel.org,m:peterz@infradead.org,m:boqun@kernel.org,m:linux-remoteproc@vger.kernel.org,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:corbet@lwn.net,m:zhang.lyra@gmail.com,m:jernej.skrabec@gmail.com,m:mingo@redhat.com,m:longman@redhat.com,m:linux-sunxi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:wilken.gottwalt@posteo.net,m:baolin.wang@linux.alibaba.com,m:skhan@linuxfoundation.org,m:linux-omap@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:orsonzhai@gmail.com,m:andersson@kernel.org,m:samuel@sholland.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:wsa@sang-engineering.com,m:zhanglyra@gmail.com,m:jernejskrabec@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,infradead.org,kernel.org,st-md-mailman.stormreply.com,lwn.net,gmail.com,redhat.com,lists.linux.dev,posteo.net,linux.alibaba.com,linuxfoundation.org,lists.infradead.org,sholland.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[wens@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_SPAM(0.00)[0.689];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stormreply.com:email,stormreply.com:url,sang-engineering.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: DD8A82CBACB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVGh1LCBNYXIgMTksIDIwMjYgYXQgNzowMOKAr1BNIFdvbGZyYW0gU2FuZwo8d3NhK3JlbmVz
YXNAc2FuZy1lbmdpbmVlcmluZy5jb20+IHdyb3RlOgo+Cj4gUHJvdmlkZXJzIGhhdmUgYmVlbiBy
ZWZhY3RvcmVkIHRvIGF2b2lkIHVzaW5nIGNvcmUgaW50ZXJuYWwgc3RydWN0dXJlcy4KPiBBcyBh
IHJlc3VsdCwgdGhleSBkbyBub3QgbmVlZCB0byBhbGxvY2F0ZSB0aGUgaHdzcGlubG9jayBkZXZp
Y2Ugb24gdGhlaXIKPiBvd24gYW55bW9yZSBiZWNhdXNlIHRoZXkgY2FuIGFjY2VzcyBldmVyeXRo
aW5nIHRoZXkgbmVlZCB3aXRoIGhlbHBlcnMuCj4KPiBTbywgdGhlIGFsbG9jYXRpb24gaXMgbW92
ZWQgdG8gdGhlIGNvcmUuIEFzIGEgcmVzdWx0LCB0aGUgcmVnaXN0ZXJpbmcKPiBmdW5jdGlvbnMg
bm93IHJldHVybiBhIHBvaW50ZXIgdG8gdGhlIChzb29uKSBvcGFxdWUgaHdzcGlubG9jayBkZXZp
Y2UKPiB3aGljaCBtYXkgYmUgbmVlZGVkIGZvciB1bnJlZ2lzdGVyaW5nIG9ubHkuCj4KPiBCZWNh
dXNlIHRoZSBhcmd1bWVudCBsaXN0IG9mIHRoZSByZWdpc3RlcmluZyBmdW5jdGlvbnMgaXMgY2hh
bmdlZCwgYWxsCj4gdXNlcnMgYXJlIGNoYW5nZWQgaGVyZSBhcyB3ZWxsLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogV29sZnJhbSBTYW5nIDx3c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbT4KPiAt
LS0KPiAgRG9jdW1lbnRhdGlvbi9sb2NraW5nL2h3c3BpbmxvY2sucnN0ICB8ICA2ICsrLS0KPiAg
ZHJpdmVycy9od3NwaW5sb2NrL2h3c3BpbmxvY2tfY29yZS5jICB8IDQ4ICsrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2h3c3BpbmxvY2svb21hcF9od3NwaW5sb2NrLmMgIHwg
MTAgKystLS0tCj4gIGRyaXZlcnMvaHdzcGlubG9jay9xY29tX2h3c3BpbmxvY2suYyAgfCAxMSAr
Ky0tLS0KPiAgZHJpdmVycy9od3NwaW5sb2NrL3NwcmRfaHdzcGlubG9jay5jICB8IDE3ICsrKyst
LS0tLS0KPiAgZHJpdmVycy9od3NwaW5sb2NrL3N0bTMyX2h3c3BpbmxvY2suYyB8ICA3ICsrLS0K
Cj4gIGRyaXZlcnMvaHdzcGlubG9jay9zdW42aV9od3NwaW5sb2NrLmMgfCAxMiArKy0tLS0tCgpB
Y2tlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGtlcm5lbC5vcmc+ICMgZm9yIHN1bjZpCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
