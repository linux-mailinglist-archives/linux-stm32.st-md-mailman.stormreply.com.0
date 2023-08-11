Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0468B778676
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Aug 2023 06:24:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87FD0C6B468;
	Fri, 11 Aug 2023 04:24:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29ABBC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Aug 2023 04:24:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DABC96146E;
 Fri, 11 Aug 2023 04:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C27C433C7;
 Fri, 11 Aug 2023 04:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691727865;
 bh=tFTch+Vt3hmXVV5W6NxEILrRRxKFsve4GjiYPL3bFxI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tDwSTMykeWxpIGLeOu3IiYkMhslf3W0y9Wd7xmQudpL+OJX6C2GX3kZkJzcIPO0AQ
 Bh9FzaJP6YfG6qeTg3ulmo0/+YSn8TQ4CJSlv44kV7jKQVjZnpxZoEbawJ83Ns+sD+
 s+eSVrjCTmW+8Ais4F+9lsn1QSbgeRvh9HMLNdNXu3osjyDo2T4OPY7GMsIFmNE9V6
 OBaHWJ6EEBKvhFqyHprATLQeyixBG6wAYb8j9pnQvm2UOhjiUGH519JqOlBKseeRjm
 tpu7AufenVwScWolHFut7isQfj5tTE2TGkA7Bj4iwJ4gQoufZ5ZFcX1NnKnxJYoH50
 zk8bxUwLkhfbQ==
Date: Thu, 10 Aug 2023 21:24:23 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Kamlesh Gurudasani <kamlesh@ti.com>
Message-ID: <20230811042423.GA1295@sol.localdomain>
References: <20230719-mcrc-upstream-v2-0-4152b987e4c2@ti.com>
 <20230719-mcrc-upstream-v2-2-4152b987e4c2@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230719-mcrc-upstream-v2-2-4152b987e4c2@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-crypto@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [Linux-stm32] [PATCH v2 2/6] crypto: crc64 - add crc64-iso
	framework
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

On Fri, Aug 11, 2023 at 12:58:49AM +0530, Kamlesh Gurudasani wrote:
> diff --git a/lib/crc64-iso.c b/lib/crc64-iso.c
> new file mode 100644
> index 000000000000..d6e803124fa0
[...]
> +u64 crc64_iso_update(u64 crc, const unsigned char *buffer, size_t len)
> +{
> +	struct {
> +		struct shash_desc shash;
> +		u64 crc;
> +	} desc;
> +	int err;
> +
> +	if (static_branch_unlikely(&crc64_iso_fallback))
> +		return crc64_iso_generic(crc, buffer, len);
> +
> +	rcu_read_lock();
> +	desc.shash.tfm = rcu_dereference(crc64_iso_tfm);
> +	desc.crc = crc;
> +	err = crypto_shash_update(&desc.shash, buffer, len);
> +	rcu_read_unlock();
> +
> +	WARN_ON_ONCE(err);
> +
> +	return desc.crc;
> +}
> +EXPORT_SYMBOL_GPL(crc64_iso_update);
> +
> +u64 crc64_iso(const unsigned char *buffer, size_t len)
> +{
> +	return crc64_iso_update(0, buffer, len);
> +}
> +EXPORT_SYMBOL_GPL(crc64_iso);

These functions are never called.

Why are you trying to add unused code to the kernel?

- Eric
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
