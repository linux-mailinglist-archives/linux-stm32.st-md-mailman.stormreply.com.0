Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M7GmJTd/T2rWiAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 13:00:07 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DC072FFAB
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Jul 2026 13:00:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=MU5ohz9b;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98768C8F274;
	Thu,  9 Jul 2026 11:00:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C6C4C1A979
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jul 2026 11:00:05 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 03178412B0;
 Thu,  9 Jul 2026 11:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5971F000E9;
 Thu,  9 Jul 2026 10:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783594803;
 bh=MprQAKh2M/FtwGqOd4VDQqoZaU2yZXCQ18QWe8n/Kng=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date;
 b=MU5ohz9bmKHFCulLWiU8ZqPv5hZFxfJzR0OkiWeQ2G8uJYXIXQXInlOo0qCBwHHJP
 09mOvg9wZj8HP6g3wXbL4tx9uDhqXRCZCPk0xhibWa73B8uTh5B/WlQHss96tEgDj/
 X2ehGRo5lUQALbIc93vI1o413xDOkiHfnJG8Jm50du3Kk1sF3fnaezkDWZxNKrBYJ9
 K/4Ai66OKaHVMT+TgysvQj6bfdarHmBiUqgYPkDj8vVuDsGC/5MghGzRyhZxvvh9xg
 vN20w6xPqIbUSomclxBcPp2GJem99Zr+unNKUmNAw2M5x/WbY2o2K1LS/noslRr2RQ
 k2hosyPEkt3VQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>
In-Reply-To: <cover.1783003256.git.u.kleine-koenig@baylibre.com>
References: <cover.1783003256.git.u.kleine-koenig@baylibre.com>
Message-Id: <178359479977.2113490.16055346814964770733.b4-ty@b4>
Date: Thu, 09 Jul 2026 11:59:59 +0100
MIME-Version: 1.0
X-Mailer: b4 0.16-dev-ad80c
Cc: James Ogletree <jogletre@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Tom Rix <trix@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, Colin Foster <colin.foster@in-advantage.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, patches@opensource.cirrus.com,
 Fred Treven <fred.treven@cirrus.com>, Ben Bright <ben.bright@cirrus.com>,
 Orson Zhai <orsonzhai@gmail.com>, Xu Yilun <yilun.xu@intel.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 0/3] mfd: Initialize spi_device_id
 arrays using member names
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
X-Spamd-Result: default: False [5.39 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:u.kleine-koenig@baylibre.com,m:jogletre@opensource.cirrus.com,m:ckeepax@opensource.cirrus.com,m:support.opensource@diasemi.com,m:zhang.lyra@gmail.com,m:trix@redhat.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:colin.foster@in-advantage.com,m:rf@opensource.cirrus.com,m:baolin.wang@linux.alibaba.com,m:mcoquelin.stm32@gmail.com,m:patches@opensource.cirrus.com,m:fred.treven@cirrus.com,m:ben.bright@cirrus.com,m:orsonzhai@gmail.com,m:yilun.xu@intel.com,m:linux-arm-kernel@lists.infradead.org,m:zhanglyra@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[opensource.cirrus.com,diasemi.com,gmail.com,redhat.com,st-md-mailman.stormreply.com,vger.kernel.org,in-advantage.com,linux.alibaba.com,cirrus.com,intel.com,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0DC072FFAB

T24gVGh1LCAwMiBKdWwgMjAyNiAxNjo1MzozOCArMDIwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgKFRo
ZSBDYXBhYmxlIEh1Yikgd3JvdGU6Cj4gdGhpcyBzZXJpZXMgdGFyZ2V0cyB0byB1c2UgbmFtZWQg
aW5pdGlhbGl6ZXJzIGZvciBzcGlfZGV2aWNlX2lkIGFycmF5cy4KPiBJbiBnZW5lcmFsIHRoZXNl
IGFyZSBiZXR0ZXIgcmVhZGFibGUgZm9yIGh1bWFucyBhbmQgbW9yZSByb2J1c3QgdG8KPiBjaGFu
Z2VzIGluIHRoZSByZXNwZWN0aXZlIHN0cnVjdCBkZWZpbml0aW9uLgo+IAo+IFRoaXMgcm9idXN0
bmVzcyBpcyBuZWVkZWQgYXMgSSB3YW50IHRvIGRvCj4gCj4gCWRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L2RldmljZS1pZC9zcGkuaCBiL2luY2x1ZGUvbGludXgvZGV2aWNlLWlkL3NwaS5oCj4g
CWluZGV4IDgxMmU3YzM4NTRhNy4uOTNkOWNkNDU1NjlhIDEwMDY0NAo+IAktLS0gYS9pbmNsdWRl
L2xpbnV4L2RldmljZS1pZC9zcGkuaAo+IAkrKysgYi9pbmNsdWRlL2xpbnV4L2RldmljZS1pZC9z
cGkuaAo+IAlAQCAtMTMsNyArMTMsMTEgQEAgdHlwZWRlZiB1bnNpZ25lZCBsb25nIGtlcm5lbF91
bG9uZ190Owo+IAo+IFsuLi5dCgpBcHBsaWVkLCB0aGFua3MhCgpbMS8zXSBtZmQ6IERyb3AgdW51
c2VkIGFzc2lnbm1lbnQgb2Ygc3BpX2RldmljZV9pZCBkcml2ZXIgZGF0YQogICAgICBjb21taXQ6
IDgzMzlmYjBlY2EzNDhkNDFmMDRiYjk2MzE3MDcxOTI1NjlmNzUzZTYKWzIvM10gbWZkOiBJbml0
aWFsaXplIHNwaV9kZXZpY2VfaWQgYXJyYXlzIHVzaW5nIG1lbWJlciBuYW1lcwogICAgICBjb21t
aXQ6IGJkYWNlYWZhZmE1NGIzZmQ0ZjlkYmE5ZTAwNDRhOTEwZjE2ZTRhMmMKWzMvM10gbWZkOiBV
bmlmeSBzdHlsZSBvZiBzcGlfZGV2aWNlX2lkIGFycmF5cwogICAgICBjb21taXQ6IDYzODRlNWM1
ZTBiY2ZiYzlhOTE1ZDcwY2IzOTI1ZTAwMjJkN2IzMzcKCi0tCkxlZSBKb25lcyBb5p2O55C85pav
XQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
