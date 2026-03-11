Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePQUH/s0sWm0rwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 10:25:15 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2099E2605A8
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 10:25:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE353C8F288;
	Wed, 11 Mar 2026 09:25:14 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB69DC8F26C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2026 09:25:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ED0C861119
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2026 09:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B6F5C2BCC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2026 09:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773221112;
 bh=01GKf65j/jScrwoKQ+C2Gxr6oYYNcBqF+y3kaUEjbLo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MF3vSz279c7gxTZF7NgmWXEwUO6gRL13DHvShsuI2CRziUEddwspHwDaaJCHkRV8i
 1e8zOtRrOs0iqe9JzaJ68RtW/nQ1cvGHa1wiWmmW48FlI7kwj/kEddAkxcXjR1yDzp
 SJIQlrnxZuj6GGfdBmJRR8x1vTwehdyhvu4FbSRfBaZTFT8aPShUh3ZNLiLOPgRB95
 yQdLMmafhM6TBUlKOPZylVs34PzLhbNs5nvhVRvc3stp3hfCZaU9UkVuxIOh1zjH1Z
 +6oVrXcP7tP8GQ//avpnN2ZW+fNxiu/UD5Y1l3+K74rROfInQkbqpAvv3i0u6ejBkK
 xqNFoTovsi7HQ==
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-79800183233so11822497b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2026 02:25:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUupBnYktAYbRW6aqRKZOUytpgrOIiC8k1Nx+3z9/fWmszxyCpU0KdR91HlENfZ7UkkwxKsqQ5+BZoCUw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyzr4wq9t78EGrCOskVC31txxJecoTR8abrdXeGp2hKIwAhAJjU
 qnH+4rVNBMTwbQ1nmunDZtnDAbDfg/ra/p7k/D18SV2vfsRhSV2vCOqWnYuYGOjWMbHXsYLmAL4
 YWIxgtlslmfu6y87vteyxBLf8Tgf5gaM=
X-Received: by 2002:a05:690c:6d84:b0:794:f400:2bfb with SMTP id
 00721157ae682-79917f593b5mr14822137b3.26.1773221111798; Wed, 11 Mar 2026
 02:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
 <20260310075539.11701-16-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260310075539.11701-16-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 10:24:59 +0100
X-Gmail-Original-Message-ID: <CAD++jLkoWCcBvB4G-2EDYU4kezPhVF6943TY6PmK5ooGwruLzA@mail.gmail.com>
X-Gm-Features: AaiRm52-5ccgCpLSKuxxaehFi73jWhXjY0Lv_AX860GJVRZU0Kw14nXERH-rf2Y
Message-ID: <CAD++jLkoWCcBvB4G-2EDYU4kezPhVF6943TY6PmK5ooGwruLzA@mail.gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-remoteproc@vger.kernel.org,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Waiman Long <longman@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 driver-core@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-iio@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Orson Zhai <orsonzhai@gmail.com>, David Lechner <dlechner@baylibre.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v4 15/15] hwspinlock/treewide: refactor
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
X-Rspamd-Queue-Id: 2099E2605A8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:rafael@kernel.org,m:peterz@infradead.org,m:boqun@kernel.org,m:skhan@linuxfoundation.org,m:linux-remoteproc@vger.kernel.org,m:nuno.sa@analog.com,m:longman@redhat.com,m:dakr@kernel.org,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:driver-core@lists.linux.dev,m:corbet@lwn.net,m:zhang.lyra@gmail.com,m:lee@kernel.org,m:linux-iio@vger.kernel.org,m:mingo@redhat.com,m:orsonzhai@gmail.com,m:dlechner@baylibre.com,m:konradybcio@kernel.org,m:srini@kernel.org,m:arnd@arndb.de,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:broonie@kernel.org,m:baolin.wang@linux.alibaba.com,m:jonathan.cameron@huawei.com,m:linux-arm-kernel@lists.infradead.org,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:tglx@kernel.org,m:mcoquelin.stm32@gmail.com,m:jic23@kernel.org,m:wsa@sang-
 engineering.com,m:zhanglyra@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,linuxfoundation.org,vger.kernel.org,analog.com,redhat.com,st-md-mailman.stormreply.com,lists.linux.dev,lwn.net,gmail.com,baylibre.com,arndb.de,linux.alibaba.com,huawei.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,huawei.com:email,mail.gmail.com:mid,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

T24gVHVlLCBNYXIgMTAsIDIwMjYgYXQgODo1NuKAr0FNIFdvbGZyYW0gU2FuZwo8d3NhK3JlbmVz
YXNAc2FuZy1lbmdpbmVlcmluZy5jb20+IHdyb3RlOgoKPiBGYWN0b3Igb3V0IHRoZSBlbnRyaWVz
IG9ubHkgbmVlZGVkIGZvciBjb25zdW1lcnMgZnJvbSB0aGUgZ2VuZXJpYyBwdWJsaWMKPiBoZWFk
ZXIuIFRoaXMgYWxsb3dzIGZvciBhIGNsZWFuIHNlcGFyYXRpb24gYmV0d2VlbiBwcm92aWRlcnMg
YW5kCj4gY29uc3VtZXJzLiBBbHNvIHJlbW92ZSBjb250YWN0IGZpZWxkIGluIGZhdm9yIG9mIE1B
SU5UQUlORVJTIGVudHJpZXMuCj4gRml4IHRoZSB1c2VycywgdG9vLgo+Cj4gU2lnbmVkLW9mZi1i
eTogV29sZnJhbSBTYW5nIDx3c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbT4KPiBBY2tl
ZC1ieTogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPgo+IEFja2VkLWJ5OiBKb25hdGhh
biBDYW1lcm9uIDxqb25hdGhhbi5jYW1lcm9uQGh1YXdlaS5jb20+ICMgZm9yIElJTwo+IEFja2Vk
LWJ5OiBMZWUgSm9uZXMgPGxlZUBrZXJuZWwub3JnPiAjIGZvciBNRkQKCkFja2VkLWJ5OiBMaW51
cyBXYWxsZWlqIDxsaW51c3dAa2VybmVsLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
