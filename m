Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2F78A566qmmiVwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Mar 2026 12:29:34 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8B421FA84
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Mar 2026 12:29:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D427C8F271;
	Fri,  6 Mar 2026 11:29:33 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C3C2C8F270
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2026 11:29:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E6D7B43B66;
 Fri,  6 Mar 2026 11:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE51C4CEF7;
 Fri,  6 Mar 2026 11:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772796569;
 bh=XryNqzJpAbwoPPJDceu+o/RMktCv0sL78kkwIFXfp2Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KqRr2BgDwmSvs5Hlh9XDngsdSc53G1yIc7aGX1uFjRRiZqnxwB1lRMQoq7QTxqesg
 JLfbnw7piKywWe9WtsSPASsCyxqBVPcdadgdgT3IM8ZM5CnX6N5rvkonx1QbasGG2s
 rOhRetD5OuGYkCOvvj+lWOYRVK7S6HfjiFhA0xcOZd9JPaT8sATuB85OOD8aiJnfRX
 y5ayFUc3Fe6Q8fXtNA6kFZrQTFk7fF/KAxeM4RQp7S34+xaBsSDpmKw6i5ncas/DuK
 yUG1/h2o/p2YUu+Yaxam0qqlC+uixpO1i7fkgLzVRc7uyVhZAefMsB+SrgcbquCpaD
 A65RtASmO4M2g==
Date: Fri, 6 Mar 2026 11:29:18 +0000
From: Lee Jones <lee@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Message-ID: <20260306112918.GG183676@google.com>
References: <20260303192600.7224-17-wsa+renesas@sang-engineering.com>
 <20260303192600.7224-32-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260303192600.7224-32-wsa+renesas@sang-engineering.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun@kernel.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 linux-remoteproc@vger.kernel.org,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Waiman Long <longman@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 driver-core@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Orson Zhai <orsonzhai@gmail.com>, David Lechner <dlechner@baylibre.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org,
 Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3 15/15] hwspinlock/treewide: refactor
 consumer.h from public header
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
X-Rspamd-Queue-Id: 9B8B421FA84
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:rafael@kernel.org,m:peterz@infradead.org,m:boqun@kernel.org,m:jonathan.cameron@huawei.com,m:linux-remoteproc@vger.kernel.org,m:nuno.sa@analog.com,m:longman@redhat.com,m:dakr@kernel.org,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:driver-core@lists.linux.dev,m:corbet@lwn.net,m:zhang.lyra@gmail.com,m:linux-doc@vger.kernel.org,m:linux-iio@vger.kernel.org,m:mingo@redhat.com,m:orsonzhai@gmail.com,m:dlechner@baylibre.com,m:konradybcio@kernel.org,m:srini@kernel.org,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:broonie@kernel.org,m:baolin.wang@linux.alibaba.com,m:skhan@linuxfoundation.org,m:linux-arm-kernel@lists.infradead.org,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:tglx@kernel.org,m:mcoquelin.stm32@gmail.com,m:linusw@kernel.org,m:jic23@kernel.org,m:wsa@sa
 ng-engineering.com,m:zhanglyra@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.829];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,huawei.com,vger.kernel.org,analog.com,redhat.com,st-md-mailman.stormreply.com,lists.linux.dev,lwn.net,gmail.com,baylibre.com,arndb.de,linux.alibaba.com,linuxfoundation.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,huawei.com:email]
X-Rspamd-Action: no action

T24gVHVlLCAwMyBNYXIgMjAyNiwgV29sZnJhbSBTYW5nIHdyb3RlOgoKPiBGYWN0b3Igb3V0IHRo
ZSBlbnRyaWVzIG9ubHkgbmVlZGVkIGZvciBjb25zdW1lcnMgZnJvbSB0aGUgZ2VuZXJpYyBwdWJs
aWMKPiBoZWFkZXIuIFRoaXMgYWxsb3dzIGZvciBhIGNsZWFuIHNlcGFyYXRpb24gYmV0d2VlbiBw
cm92aWRlcnMgYW5kCj4gY29uc3VtZXJzLiBBbHNvIHJlbW92ZSBjb250YWN0IGZpZWxkIGluIGZh
dm9yIG9mIE1BSU5UQUlORVJTIGVudHJpZXMuCj4gRml4IHRoZSB1c2VycywgdG9vLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFdvbGZyYW0gU2FuZyA8d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5j
b20+Cj4gQWNrZWQtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4KPiBBY2tlZC1i
eTogSm9uYXRoYW4gQ2FtZXJvbiA8am9uYXRoYW4uY2FtZXJvbkBodWF3ZWkuY29tPiAjIGZvciBJ
SU8KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9sb2NraW5nL2h3c3BpbmxvY2sucnN0ICAgICAgICAg
ICAgICB8ICAyICstCj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMSAtCj4gIGRyaXZlcnMvYmFzZS9yZWdtYXAvcmVnbWFwLmMgICAgICAgICAg
ICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL2h3c3BpbmxvY2svaHdzcGlubG9ja19jb3Jl
LmMgICAgICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9paW8vYWRjL3NjMjd4eF9hZGMuYyAg
ICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtc3RtMzJt
cC1leHRpLmMgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL21mZC9zeXNjb24uYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KCkFja2VkLWJ5OiBMZWUgSm9uZXMg
PGxlZUBrZXJuZWwub3JnPgoKPiAgZHJpdmVycy9udm1lbS9zYzI3eHgtZWZ1c2UuYyAgICAgICAg
ICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvbnZtZW0vc3ByZC1lZnVzZS5jICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3Ry
bC1zdG0zMi5jICAgICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9zb2MvcWNvbS9zbWVtLmMg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvc3BpL3NwaS1zcHJk
LWFkaS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICAuLi4vbGludXgve2h3c3Bp
bmxvY2suaCA9PiBod3NwaW5sb2NrL2NvbnN1bWVyLmh9IHwgMTUgKysrKysrLS0tLS0tLS0tCgot
LSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
