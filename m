Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DllHHhRlGktCQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 12:31:04 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7640114B60B
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 12:31:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDCACC5A4C5;
	Tue, 17 Feb 2026 11:31:02 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 733FBC055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 11:31:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6905E60128;
 Tue, 17 Feb 2026 11:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B69C19423;
 Tue, 17 Feb 2026 11:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771327860;
 bh=MoBw/M7yTwvIYgJNMf0Ti215ru/rCJSxdxH12EyqkRE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=rt/124FKXEMGsB7bD25BXeYp95XUgGbseWipfUuWLdZOOZv405e78t0W+h0fgRmj4
 YGaOj0k5U3kXOJ8POmrF8zq9+tRd1rzKeealx4/oyEtCYMKFjaOQy0bLiYv9dgthNj
 k4cOojt5hzgOT8W6nnPRuAmlMwK/pcQ3ff+Wc5zE4d3opZd2L9oYUTQGiIc1s7i3LY
 uQXVc+SKy7IPRlQHBO661E9vZSwLzckiQcdZt9511KNara9sGhuEAIW4GLhHUOd0zf
 iGPgutV6HBhq7zgB9aw7KJ8XQmcYwR6sR1FGq1HNxIOseh1EKtILCdUD882SXogm0o
 BiVHl2E3Aw1ng==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfauth.phl.internal (Postfix) with ESMTP id EF2A7F40068;
 Tue, 17 Feb 2026 06:30:58 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-01.internal (MEProxy); Tue, 17 Feb 2026 06:30:58 -0500
X-ME-Sender: <xms:clGUablUvze5eKNUulZ--y_zP_LHYCe-ldwjYWGPjbIekxf0v2wJ3w>
 <xme:clGUaZocsAbWZ01UisRnjsktu6sKxYdGikBJUzbRpAePVTIYCsO2hyR0qkKgO8mm3
 oCnzM-VNV_OAmZkK8qwA-XoMv9SE-vO4N-NUP3TLTmdRlqv6ytTQjrp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvudelieegucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
 uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
 htthgvrhhnpedvueehiedtvedtleekuddutefgffdtleetfeetveejveejieehfefhjeei
 jeefudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grrhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeel
 qdeffedvudeigeduhedqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrh
 gurdgtohhmpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphht
 thhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomhdprhgtph
 htthhopehmtghoqhhuvghlihhnrdhsthhmfedvsehgmhgrihhlrdgtohhmpdhrtghpthht
 ohepihhlihgrshdrrghprghlohguihhmrghssehlihhnrghrohdrohhrghdprhgtphhtth
 hopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdr
 ohhrghdprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskhhisehoshhsrd
 hquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopehlihhnuhigqdhsthhmfedvsehsthdq
 mhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomhdprhgtphhtthhopehlih
 hnuhigqdgvfhhisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
 gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:clGUaUkeeLE4PbdNc1DmTaiXFcMcPqjjjHHfjg72dotE7YGG0GtJQA>
 <xmx:clGUaQZiciyB-9njMfRazOBx0CP3QiWhEuh3zjNEaz11jAtGA5AUVw>
 <xmx:clGUaXFZ87XFM_x0qiGwPQKDnvt7hXejvS9Bp8LOxOk3r4hKWv3DtA>
 <xmx:clGUaXacmb1x6AF7Vj0RhOabaaxvRjzzKKh98j5tg9rxgZ5Po0cY5w>
 <xmx:clGUaTx636mfQpbU1SNYFwMI9HGSvcHYQuJGZOf35EwsIX-xHYxjkFyN>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id C9718700065; Tue, 17 Feb 2026 06:30:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AEQLpXAyzQ_-
Date: Tue, 17 Feb 2026 12:30:38 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>
Message-Id: <93de9e85-faf1-4394-a374-f9207bd823c7@app.fastmail.com>
In-Reply-To: <5823f778-d422-4190-99bf-d66ffa437f6c@oss.qualcomm.com>
References: <20260215110628.34293-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAC_iWjKQA0k+DTFpTDGieCK0qNL3=BCSiOPOtCo5gvdOtXd-cA@mail.gmail.com>
 <25d66619-23a2-4566-bbc3-83be8eae9d46@oss.qualcomm.com>
 <CAC_iWjKXcp8mmUaFphHRjJc+n3RNasVi91+_eP-mm3a9pnmYSg@mail.gmail.com>
 <5823f778-d422-4190-99bf-d66ffa437f6c@oss.qualcomm.com>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] efi: stmm: Constify struct
	efivar_operations
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.80 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:ilias.apalodimas@linaro.org,m:linux-efi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[ardb@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ardb@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7640114B60B
X-Rspamd-Action: no action



On Mon, 16 Feb 2026, at 12:07, Krzysztof Kozlowski wrote:
> On 16/02/2026 11:43, Ilias Apalodimas wrote:
>> On Mon, 16 Feb 2026 at 12:33, Krzysztof Kozlowski
>> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>>
>>> On 16/02/2026 10:49, Ilias Apalodimas wrote:
>>>> Hi Krzysztof,
>>>>
>>>> On Sun, 15 Feb 2026 at 13:06, Krzysztof Kozlowski
>>>> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>>>>
>>>>> The 'struct efivar_operations' is not modified by the driver after
>>>>> initialization, so it should follow typical practice of being static
>>>>> const for increased code safety and readability.
>>>>
>>>> get_maintainers doesn't include me in the cc list?
>>>
>>> I use only get_maintainers and as you can see no. You might want to add
>>> yourself as maintainer of this driver if that's your part. Or have
>>> korgalore/lei filters.
>> 
>> Hrrm, that's weird. Running it locally returns a more extended list
>> which includes me and Sumit Garg.
>
> You might be using git fallback, but this is not a maintainer. It shows
> random people either involved or not involved (like cc-ing me on half of
> kernel drivers), thus it is not recommended for daily use and all tools
> (e.g b4 or personal scripts) do not use fallbacks.
>

The code you are touching came in via a different tree in the current merge window, and so this patch doesn't even apply to the EFI tree. Those 'random people' are the ones you should have sent this to, if you had taken the time to look at the history of the code you are modifying. So please don't lecture other people on how to use the tools.

I've queued this up now - I'll send it to Linus by the end of the week. Thanks.



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
