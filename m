Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YgySC/GxKGoSIQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 02:38:09 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE02664FC6
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 02:38:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=kMOvifmd;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56928C8F292;
	Wed, 10 Jun 2026 00:38:08 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 207A7C5F1F7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2026 00:38:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id F1BDF602C4;
 Wed, 10 Jun 2026 00:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC47E1F00893;
 Wed, 10 Jun 2026 00:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781051885;
 bh=EevDIl3T2tRBqKOfS6hGhqCsYiv62Le6WH61wInv79E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=kMOvifmdrxuqXxaTsT7spri7/bwWkkDRVMbJ/XqDSXYookm952FeqwRm2HxMp5mYY
 nWkmXXOuZV8rl2zXMgE2RAKtR9aEN4/Ke5uOTWtj6KPJdDw3YM0Zu/QvxyNfXUtZww
 bPKoYSVqJ+kD+2HylJDpSzc4/YkXqGgqy4zHnMb80oAtPlGO4h01f4GV8jhXzPPdeJ
 AJywWCIqPchi3OmLGlnEL1He6wD/klnKE5rFKr/+9/JLMsEBOfLZMIEz2/Lon4GF7W
 zonQvFtAA5c8IzxsTKNm5cjUQXpJ8xM75DhEPj0au4u6X4huY0LiKA9OgjiKqIJGLd
 8/fBQSYk0k7Aw==
Date: Tue, 9 Jun 2026 17:38:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Carlos Fangmeier <carlos.fangmeier@gmail.com>
Message-ID: <20260609173804.77d13413@kernel.org>
In-Reply-To: <20260605-main-v1-1-aed15b1cf1af@gmail.com>
References: <20260605-main-v1-1-aed15b1cf1af@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: prevent kernel panic during
 XDP program and XSK pool transitions
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:carlos.fangmeier@gmail.com,m:linux-kernel@vger.kernel.org,m:hawk@kernel.org,m:daniel@iogearbox.net,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:john.fastabend@gmail.com,m:ast@kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:sdf@fomichev.me,m:mcoquelin.stm32@gmail.com,m:boon.leong.ong@intel.com,m:bpf@vger.kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:carlosfangmeier@gmail.com,m:johnfastabend@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,iogearbox.net,st-md-mailman.stormreply.com,gmail.com,lunn.ch,google.com,fomichev.me,intel.com,redhat.com,davemloft.net,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BEE02664FC6

T24gRnJpLCAwNSBKdW4gMjAyNiAwMDo1NjozNSAtMDcwMCBDYXJsb3MgRmFuZ21laWVyIHdyb3Rl
Ogo+IHN0bW1hY194ZHBfc2V0X3Byb2coKSB0ZWFycyBkb3duIGFuZCByZWJ1aWxkcyBhbGwgRE1B
IGNoYW5uZWxzIHZpYQo+IHN0bW1hY194ZHBfcmVsZWFzZSgpL3N0bW1hY194ZHBfb3BlbigpIHdp
dGhvdXQgcGF1c2luZyB0aGUgbmV0ZGV2Cj4gVFggcGF0aC4gU2ltaWxhcmx5LCBzdG1tYWNfeGRw
X2VuYWJsZV9wb29sKCkgYW5kCj4gc3RtbWFjX3hkcF9kaXNhYmxlX3Bvb2woKSByZWNvbmZpZ3Vy
ZSBpbmRpdmlkdWFsIHF1ZXVlIERNQSByaW5ncwo+IHdoaWxlIFRYIHJlbWFpbnMgYWN0aXZlLgoK
VGhpcyBzdGlsbCBsb29rcyByYWN5LiBQbGVhc2UgbG9vayBhdCBvdGhlciBkcml2ZXJzCgo+IElm
IHRoZSBrZXJuZWwgdHJhbnNtaXRzIGEgZnJhbWUgZHVyaW5nIHRoZXNlIHdpbmRvd3Mg4oCUIGZv
ciBleGFtcGxlIGFuCj4gTUxEIHJlcG9ydCBxdWV1ZWQgYnkgdGhlIElQdjYgc3RhY2sg4oCUIHN0
bW1hY194bWl0KCkgY2FsbHMKPiBkd21hYzRfc2V0X2FkZHIoKSBhZ2FpbnN0IGFuIE1NSU8gcmVn
aXN0ZXIgd2hvc2UgbWFwcGluZyBoYXMgYmVlbgo+IHRvcm4gZG93biwgdHJpZ2dlcmluZyBhIGxl
dmVsLTMgdHJhbnNsYXRpb24gZmF1bHQ6Cj4gCj4gICBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBw
YWdpbmcgcmVxdWVzdCBhdCB2aXJ0dWFsIGFkZHJlc3MgZmZmZjgwMDA4NDBlYzAwMAo+ICAgcGMg
OiBkd21hYzRfc2V0X2FkZHIrMHg4LzB4MTgKPiAgIGxyIDogc3RtbWFjX3htaXQrMHg2NGMvMHhi
NjAKPiAgIENhbGwgdHJhY2U6Cj4gICAgZHdtYWM0X3NldF9hZGRyKzB4OC8weDE4Cj4gICAgZGV2
X2hhcmRfc3RhcnRfeG1pdCsweGIwLzB4MjIwCj4gICAgc2NoX2RpcmVjdF94bWl0KzB4MTA4LzB4
M2YwCj4gICAgX19kZXZfcXVldWVfeG1pdCsweDg0NC8weGQwMAo+ICAgIGlwNl9maW5pc2hfb3V0
cHV0MisweDJkOC8weDYxMAo+ICAgIG1sZF9zZW5kcGFjaysweDE4MC8weDJlMAo+ICAgIG1sZF9p
ZmNfd29yaysweDFkYy8weDQ4MAo+IAo+IFRoZSBleGlzdGluZyBuZXRpZl90eF9kaXNhYmxlKCkg
aW4gc3RtbWFjX3hkcF9yZWxlYXNlKCkgaXMgbm90Cj4gc3VmZmljaWVudCBiZWNhdXNlIHN0bW1h
Y194ZHBfb3BlbigpIHJlLWVuYWJsZXMgVFggdmlhCj4gbmV0aWZfdHhfc3RhcnRfYWxsX3F1ZXVl
cygpIGJlZm9yZSB0aGUgY2FsbGVyIHJlZ2FpbnMgY29udHJvbCwgbGVhdmluZwo+IGEgd2luZG93
IHdoZXJlIHRoZSBmcmVzaGx5IHJlYnVpbHQgcmluZ3MgY2FuIHJhY2Ugd2l0aCBwZW5kaW5nIFRY
IHdvcmsuCj4gCj4gRml4IHRoaXMgYnkgd3JhcHBpbmcgZWFjaCByZWNvbmZpZ3VyYXRpb24gcGF0
aCB3aXRoCj4gbmV0aWZfdHhfZGlzYWJsZSgpL25ldGlmX3R4X3dha2VfYWxsX3F1ZXVlcygpOgo+
IAo+ICAtIHN0bW1hY194ZHBfc2V0X3Byb2coKTogaG9sZCBUWCBkaXNhYmxlZCBhY3Jvc3MgdGhl
IGZ1bGwKPiAgICBzdG1tYWNfeGRwX3JlbGVhc2UoKSArIHN0bW1hY194ZHBfb3BlbigpIHNlcXVl
bmNlLCBvbmx5IHdha2luZwo+ICAgIFRYIGFmdGVyIHN0bW1hY194ZHBfb3BlbigpIHJldHVybnMu
Cj4gCj4gIC0gc3RtbWFjX3hkcF9lbmFibGVfcG9vbCgpOiBkaXNhYmxlIFRYIGJlZm9yZSB0ZWFy
aW5nIGRvd24gdGhlCj4gICAgcXVldWUsIHJlLWVuYWJsZSBhZnRlciB0aGUgcXVldWUgaXMgcmVi
dWlsdCBhbmQgTkFQSSBpcyBhY3RpdmUuCj4gCj4gIC0gc3RtbWFjX3hkcF9kaXNhYmxlX3Bvb2wo
KTogc2FtZSBwYXR0ZXJuIGFyb3VuZCB0aGUgcG9vbCB0ZWFyZG93bgo+ICAgIGFuZCBxdWV1ZSBy
ZWJ1aWxkLgo+IAo+IFRlc3RlZCBvbiBDb3J0ZXgtQTU1IChzdG1tYWMvZHdtYWM0LCBrZXJuZWwg
Ni42LjYwKSB3aXRoIEFGX1hEUAoKVGhhdCdzIGFuIGFuY2llbnQga2VybmVsLCB5b3UnbGwgaGF2
ZSB0byB0ZXN0IGFuIHVwc3RyZWFtIGtlcm5lbApmb3IgdXMgdG8gbWVyZ2UgdGhlIHBhdGNoCi0t
IApwdy1ib3Q6IGNyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
