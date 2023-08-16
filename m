Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C1577E237
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Aug 2023 15:10:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7B7FC6B45F;
	Wed, 16 Aug 2023 13:10:43 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35527C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 13:10:43 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 9A3193200921;
 Wed, 16 Aug 2023 09:10:40 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Wed, 16 Aug 2023 09:10:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1692191440; x=1692277840; bh=dbk6un3F9NnxFuDCsKeUUKbwa0Jf99CB0Bc
 mOR3Wn+0=; b=CLEqak0tE68MU7X604tFBhFvR3ckdz9EVSqebZDPM4412w5LT32
 v39CH8OHGm1G46dZFDLtCVNJDg9Iqb/lXNC6YIZc4qKv8YuF1ocRjytH43SYOlVO
 x5K8Ianu6vf9dVHikV7j2zQk3cTu4+gbTWDPgeVXWrfUTJHcbzA4hFVIqtdFcGbQ
 n9WvYCZsLJDF8OpxjZp2DY+RdN1QHlHy58tqLrXukT4KbHRV7Zj8Kwul8QOuqHLW
 sNMOPFbLMYflBBiG6gG5XfKDOtS+lJ51zu4raPz7gho3HxC3QXB8hz/Dv8QBeYOF
 n+cL+LFUtuKWP/8N9W1jaf7ZSeXOhzbvYNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1692191440; x=1692277840; bh=dbk6un3F9NnxFuDCsKeUUKbwa0Jf99CB0Bc
 mOR3Wn+0=; b=Ei+4V9vSBYhEDhIyw2K+eQBiq8yLHWNbg0Vyqb03n0nh9NiUtmu
 3YXh7IzxYKbFzhgwBkpfqkfaBn2/PWQHNBd9YG3zRC2Wd0qbmB/zYqfJg40il6YT
 sZJSzGVvsSV1jCBNQBavIUi9+tJAkjlT8Z3y6B50ichQEjlLmqz50klHvppwLjcZ
 IS3ZNrKwYlE87Pk+40xA4ylWSTiomicW37jPfGqtBGmMLIGwx1UFegnYrhpgFM4s
 1m7zhytJb11/eLsSRxCNEj9MECsLhpz28mQ+MG8d7156A1ot/viEXUM8HM0uCLJU
 sk9yjgzQNxYi8T58q9L99YOk1z4EZV4DMhQ==
X-ME-Sender: <xms:z8rcZGMqhiJVQkL9IjXfwu6mnuORyhH4MOQNJ6tTLpHgsNL0hCWNjg>
 <xme:z8rcZE8ab3LP9R4_kopyEp8YI4FkZEnFsfnW-PvI1gzmW1vDbYUguUdsM1a8-8hc2
 RM2tIW0-QftF3fdc74>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddtledgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
 gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:z8rcZNSFJUXm7tJqf7pd6zJ-EhpqhX-9I0DqEBem-u93B8xOQvN4pw>
 <xmx:z8rcZGvfiaO3tkaZnFUGFgyt5KmPTxXcwNlIy9lNYpYAp-jGUHg73A>
 <xmx:z8rcZOcGVn25vovTgrgWsZD4t0r0gdxoKcMNA6RoCfJAaeh4ry4OGg>
 <xmx:0MrcZEvWn2oPgo6BgojWIa1ndLwZb8v7cKa1MK4BQTXiGxqNB7S0VA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7A443B60089; Wed, 16 Aug 2023 09:10:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <500a73ea-98e9-4b85-a34f-88a7bd98550d@app.fastmail.com>
In-Reply-To: <20230816113326.1468435-1-geert@linux-m68k.org>
References: <20230816113326.1468435-1-geert@linux-m68k.org>
Date: Wed, 16 Aug 2023 15:10:19 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Alessandro Zummo" <a.zummo@towertech.it>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Valentin Caron" <valentin.caron@foss.st.com>
Cc: linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] rtc: stm32: Use
	NOIRQ_SYSTEM_SLEEP_PM_OPS()
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

T24gV2VkLCBBdWcgMTYsIDIwMjMsIGF0IDEzOjMzLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6
Cj4gSWYgQ09ORklHX1BNX1NMRUVQPW4gKGUuZy4gbTY4ay9hbGxtb2Rjb25maWcpOgo+Cj4gICAg
IGRyaXZlcnMvcnRjL3J0Yy1zdG0zMi5jOjkwNDoxMjogZXJyb3I6IOKAmHN0bTMyX3J0Y19yZXN1
bWXigJkgZGVmaW5lZCAKPiBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWZ1bmN0aW9uXQo+
ICAgICAgIDkwNCB8IHN0YXRpYyBpbnQgc3RtMzJfcnRjX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpk
ZXYpCj4gCSAgfCAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4KPiAgICAgZHJpdmVycy9ydGMv
cnRjLXN0bTMyLmM6ODk0OjEyOiBlcnJvcjog4oCYc3RtMzJfcnRjX3N1c3BlbmTigJkgZGVmaW5l
ZCAKPiBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWZ1bmN0aW9uXQo+ICAgICAgIDg5NCB8
IHN0YXRpYyBpbnQgc3RtMzJfcnRjX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+IAkgIHwg
ICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fgo+Cj4gSW5kZWVkLCB0aGUgcHJldmlvdXMgY2hh
bmdlIG1peGVkIHVwIHRoZSBzZW1hbnRpY3MgYmV0d2Vlbgo+IFNFVF9OT0lSUV9TWVNURU1fU0xF
RVBfUE1fT1BTKCkgYW5kIE5PSVJRX1NZU1RFTV9TTEVFUF9QTV9PUFMoKS4KPiBGaXggdGhpcyBi
eSB1c2luZyB0aGUgbW9kZXJuIE5PSVJRX1NZU1RFTV9TTEVFUF9QTV9PUFMoKSBpbnN0ZWFkLgo+
Cj4gUmVwb3J0ZWQtYnk6IG5vcmVwbHlAZWxsZXJtYW4uaWQuYXUKPiBGaXhlczogYTY5YzYxMGUx
M2UyYjJkZSAoInJ0Yzogc3RtMzI6IHJlbW92ZSBpbmNvcnJlY3QgI2lmZGVmIGNoZWNrIikKPiBT
aWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgoK
UmV2aWV3ZWQtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
