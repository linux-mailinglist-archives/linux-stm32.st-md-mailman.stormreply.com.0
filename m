Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF122CAF3CE
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Dec 2025 09:03:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66202C5F1CF;
	Tue,  9 Dec 2025 08:03:57 +0000 (UTC)
Received: from flow-a6-smtp.messagingengine.com
 (flow-a6-smtp.messagingengine.com [103.168.172.141])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D617C1A979
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Dec 2025 20:06:01 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailflow.phl.internal (Postfix) with ESMTP id 15BE51380418;
 Mon,  8 Dec 2025 15:06:00 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Mon, 08 Dec 2025 15:06:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm3; t=1765224360; x=1765231560; bh=geGVe3G5SB
 gEZ59+oVuK/Iwq85pb8lTkLlayLey8xSA=; b=RCw4MYw+7ZLDHkj305wxxjCRSX
 rMrdbrBgi9f25g/3it320zvhMNV1ZQKoK4HMoVtdSMCSQxa3T1NtQGZK2ji7FaB+
 4EAMXj2Z/18fg18HLzgIp1Xd2gaRaVf6aOd9tq+17uy6+b25gxNy3mnV9680Kb9/
 5tqHVF1j8ty4YqRtlzJwDQD/AFabZMuWlqsu+ivO0qERdUZBTsbfvToLgDReiU2c
 Lh/Eba71Uo99rQNJKXg+dWVZlsvVZ4EEWaxpUn0pfDgHeJqy1Ci7jT91cm3WjvPy
 sTJxo0O0i2VTRszFsHu9XlHbQZYuMm/iGITipFRODxC1B8IcWm5/KrQbrMbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1765224360; x=1765231560; bh=geGVe3G5SBgEZ59+oVuK/Iwq85pb8lTkLla
 yLey8xSA=; b=voCV257E8ExI8LRf6UdVA7F02TYLxADA60npChdBR6Y21xs0tRA
 C1uw+AV9CLSaNfK6RAUV6AE1RZBKQaSh2/pgZThaQt1P282do/o12nWenujxz3Pg
 /tdhnCFD0X7RQQSdVppzFajbBlqF0NSSuk+kHONsZxH3CEBuJYx+4gBEMsH+gyIP
 razXamAr0cLJLucn4Z8U6ZvWzmg4VLNRkI8fW7bkvNN/o41lmXQ/g0VAlsbl0p+c
 9kOr6shetIpWgA2fAxvQUSRm6uEgMj9wjThm4m3EyfuK4xRaW/GPDonriBPihui9
 NKID6dEU3zuG8C0j+xnEP0PQag6LUCS0h3A==
X-ME-Sender: <xms:pi83aTQUBBxxcwI8Ju7BapuF7LwulYjYQpKe7sWAR0r_uWtzDdDwRg>
 <xme:pi83aebVHsxrKMEuQywvzdXSDZHpM9MK2UiluZkdXAVmh0J0nNZu6U6gfkZg9j0Ga
 Ut53OsW7mEjA55oME3b-thugVKSe0_5Tbewl2mI88XfPPTSUxekmw>
X-ME-Received: <xmr:pi83acQeu23D1kI1rLhQ4wr0x5rXNlW92yKuzfJ9DXbmbyD1PnQo3LIx3zAyL52iJBsHs4oNCdPXZZnY0nx-sHu7J1Hs6kJCHtU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeehlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghnnhgvucfi
 rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepgfduue
 ffleefkeegueektdehkeejtedtffdtudejhfdvheetgfeigfeltdeufeejnecuffhomhgr
 ihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepvdei
 pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehprghulhhksehshihsqdgsrghsvg
 drihhopdhrtghpthhtoheprhguuhhnlhgrphesihhnfhhrrgguvggrugdrohhrghdprhgt
 phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
 gtphhtthhopegrnhguhidrshhhvghvtghhvghnkhhosehgmhgrihhlrdgtohhmpdhrtghp
 thhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopegrnhgurhgvfidrjhhonh
 gvsheslhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhomhgrphesvhhgvghr
 rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehophgvnhgsmhgtsehlihhsthhsrdhoii
 hlrggsshdrohhrghdprhgtphhtthhopehlihhnuhigqdhsohhunhgusehvghgvrhdrkhgv
 rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:pi83aZ4RCJmeDa-VR1cQPG2ul73JR-gGDUFjKdpu-22mFdL9oWUOfw>
 <xmx:pi83aXrSwaSszaHmCrk55lMdmsGtmyEQHQ1s-QpJy4Rt1_cXfEHipg>
 <xmx:pi83aUR5DbLatVwQOF8-uRLn9TImi_QeLc8Ti5pE_VqfQwUHqh1VcA>
 <xmx:pi83aTtoeQfXbJumEOlxloGR9zkRk3a07od05eZIJLIDpzutEw-WGg>
 <xmx:qC83aQtVE-oT3QFyD3EhDToVHKkkvo2HfKm_z0WZaMfBkC3mxyGDZ6m_>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Dec 2025 15:05:57 -0500 (EST)
Date: Mon, 8 Dec 2025 21:05:55 +0100
From: Janne Grunau <j@jannau.net>
To: Paul Kocialkowski <paulk@sys-base.io>
Message-ID: <20251208200555.GA333481@robin.jannau.net>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
 <aTcVXrUXVsyjaT22@shepard>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aTcVXrUXVsyjaT22@shepard>
X-Mailman-Approved-At: Tue, 09 Dec 2025 08:03:56 +0000
Cc: linux-sh@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-omap@vger.kernel.org, openbmc@lists.ozlabs.org, x86@kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 Matti Vaittinen <mazziesaccount@gmail.com>, linux-sound@vger.kernel.org,
 linux-gpio@vger.kernel.org, andrew.jones@linux.dev,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-mips@vger.kernel.org,
 asahi@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] Kconfig dangling references (BZ 216748)
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

On Mon, Dec 08, 2025 at 07:13:50PM +0100, Paul Kocialkowski wrote:
> Hi Randy,
> 
> On Sun 07 Dec 25, 18:04, Randy Dunlap wrote:
> > from  https://bugzilla.kernel.org/show_bug.cgi?id=216748
> > 
> > The bugzilla entry includes a Perl script and a shell script.
> > This is the edited result of running them (I removed some entries that were noise).
> 
> [...]
> 
> > DRM_KMS_DMA_HELPER ---
> > drivers/gpu/drm/adp/Kconfig:9:	select DRM_KMS_DMA_HELPER
> > drivers/gpu/drm/logicvc/Kconfig:7:	select DRM_KMS_DMA_HELPER
> 
> For these two, the symbol was removed in commit
> 09717af7d13d63df141ae6e71686289989d17efd

That commit removed DRM_KMS_CMA_HELPER. Later commit 6bcfe8eaeef0
("drm/fb: rename FB CMA helpers to FB DMA helpers") renamed
DRM_KMS_CMA_HELPER erroneously to DRM_KMS_DMA_HELPER.

> but these two drivers either were
> missed by the batch rename or were introduced a bit later.

In the case of drivers/gpu/drm/adp/Kconfig it was missed much later
during review (but iirc went through the same rename out of tree).

> Since the symbol selected DRM_GEM_CMA_HELPER (which is still needed by the
> drivers), it should be replaced with DRM_GEM_CMA_HELPER.

That symbol doesn't exist anymore either. It's now DRM_GEM_DMA_HELPER
which is already present in both files.

So the "select DRM_KMS_DMA_HELPER" lines can be removed from both files.

Janne
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
