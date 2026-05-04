Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPiGEVTX+GlR2AIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 19:28:52 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E9F4C1EC4
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 19:28:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A3A1C57A50;
	Mon,  4 May 2026 17:28:51 +0000 (UTC)
Received: from fout-a1-smtp.messagingengine.com
 (fout-a1-smtp.messagingengine.com [103.168.172.144])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C143AC56612
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 May 2026 17:28:49 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id E63BEEC02EF;
 Mon,  4 May 2026 13:28:48 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
 by phl-compute-04.internal (MEProxy); Mon, 04 May 2026 13:28:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1777915728;
 x=1778002128; bh=Gm7TSTvSP/HRTmiDQoXbmwTBkNYAkkRSd/YDya8DYlw=; b=
 jMHsXegICy9pjmFcp5P2tiRavDgFo5sTAEtFdJ0RUUGdWYi5AWcOM1FhCUvx/+66
 KHmrDCJoOURcz+KREx579n64M7BYLjomlxpOxctPcc/j3hKCnVxU6pnK+gYKtLYf
 Ledrrux5J/z/DkX6XgG0IWRSrkrz5KWnd196oZRyiS0Uq0Y3P4nzLQ3LfyhPcS79
 B26Uy65HbIIyDJSVQNBJM7RA2C7WVDOzaFdhKAXRsMxcjAnBndgNyE60LQgL2aXV
 7qNQWifuLdy20963X/ExKrdisVvP+G2E7zkxWOFVab0atf8VEIC3rT3hf/MrogqU
 wW3aEUm1JBfUsaQcEiBaaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777915728; x=
 1778002128; bh=Gm7TSTvSP/HRTmiDQoXbmwTBkNYAkkRSd/YDya8DYlw=; b=u
 xdhum8LkdxL7i3pbiSSJbtyXzQaphCMXoosCURMasqgGdEIC3eQUvB8oqrb2Q2PN
 SgLUS1YFE+9rBNekUWyPaNvyWhn8br2qlgOlJ39H8gJ97c2VKC18VbV2uiUo02eT
 VU1wfz1rJxNK3qU9toMhMrWL6Ssyk427QyLaPt6jdLaUfeyNj5pJKpMoCvYL6AUo
 xQmw9QLBa8nbM2Ux3NdUFfkLdNhEa7KUEv24w5rV5+nlSbEQJLE7TBGJsy5Qze0i
 idirfOVwnMDcmUSa1nSnfetEw44PFUB8GawyR33FIwvBJjdycDPsvTJ76pghGpK8
 SMvrYb34Ll0dKeFAoueIg==
X-ME-Sender: <xms:UNf4aQdUxjhjU7nUZ-TZ9b6o4wNZb9f0sjcR-hhNwBkqt6N-D19cmg>
 <xme:UNf4adDk8r93CLJXy9qcumkGUzcS27SolOUJHihujqRm96Oyn82vGCGGcrAdd1H8q
 8FYhYbZcxqkA0nInmIvlXjE6rgPDBh7E__xqPk_HnY0Xrj0CghO0k4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdelleeggecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
 uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
 hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
 ucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
 esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedujedpmhhouggvpehsmhhtphhouhht
 pdhrtghpthhtohepnhhunhhordhsrgesrghnrghlohhgrdgtohhmpdhrtghpthhtoheprg
 guuhhrvghghhgvlhhlohessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepughlvggt
 hhhnvghrsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehsfhhkihhnghesfhgufi
 gutgdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhs
 rdhsthdrtghomhdprhgtphhtthhopehmtghoqhhuvghlihhnrdhsthhmfedvsehgmhgrih
 hlrdgtohhmpdhrtghpthhtoheprghnghgvlhhosehkvghrnhgvlhdqshhprggtvgdrohhr
 ghdprhgtphhtthhopegrnhguhieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhitg
 dvfeeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:UNf4aWBA7jMTsgcxkwQhgZRTrmwgIMhxumlZGLZywTAMAFR61Hi7kQ>
 <xmx:UNf4aZRE8F_w98hkds6vvfEplo9U0VZXhqhKXaYqZLDCWeridPO4aA>
 <xmx:UNf4aYRK-ZEymYOKu-ndestvH63s1ZSBPJOjENdgRRIqe_Ug2QlgOQ>
 <xmx:UNf4aXLp4atYBtwihUVFj8Y7Z_x7P6NiQh39LCnPJhjOWOlyy-sI4g>
 <xmx:UNf4aYVGSufHwaLWZxvk004RbaBVDbrS1Ii7zi-rO300XGeE0EM-2ogD>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 7DA46700065; Mon,  4 May 2026 13:28:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AV3Os5nlAIEw
Date: Mon, 04 May 2026 19:28:28 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Angelo Dureghello" <angelo@kernel-space.org>,
 "Greg Ungerer" <gerg@linux-m68k.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Steven King" <sfking@fdwdc.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Jonathan Cameron" <jic23@kernel.org>,
 "David Lechner" <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>
Message-Id: <ef773bbd-1cf2-4cc2-96a8-fccd3355d6b1@app.fastmail.com>
In-Reply-To: <20260504-wip-stmark2-dac-v1-8-874c36a4910d@baylibre.com>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
 <20260504-wip-stmark2-dac-v1-8-874c36a4910d@baylibre.com>
Cc: Angelo Dureghello <adureghello@baylibre.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Greg Ungerer <gerg@uclinux.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 08/10] m68k: stmark2: add mcf5441x DAC
	platform devices
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
X-Rspamd-Queue-Id: D9E9F4C1EC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.40 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[arndb.de:s=fm2,messagingengine.com:s=fm3];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arndb.de : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel-space.org,linux-m68k.org,fdwdc.com,gmail.com,foss.st.com,kernel.org,baylibre.com,analog.com];
	FORGED_SENDER(0.00)[arnd@arndb.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:angelo@kernel-space.org,m:gerg@linux-m68k.org,m:geert@linux-m68k.org,m:sfking@fdwdc.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:adureghello@baylibre.com,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:gerg@uclinux.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arndb.de:-,messagingengine.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.510];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[app.fastmail.com:mid,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]

On Mon, May 4, 2026, at 19:16, Angelo Dureghello wrote:
> @@ -94,8 +94,42 @@ static struct platform_device dspi_spi0_device = {
...
> +static struct resource dspi_dac1_resource[] = {
> +	[0] = {

This looks like the name has a copy-paste error: this is not
related to the 'dspi' controller at all but is just the dac, right?

      Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
