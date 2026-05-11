Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gH0IMYXoAWoRmQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 11 May 2026 16:32:37 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C4A510349
	for <lists+linux-stm32@lfdr.de>; Mon, 11 May 2026 16:32:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73CBAC8F287;
	Mon, 11 May 2026 14:32:36 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59661C87EC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2026 14:32:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3EEE56001A;
 Mon, 11 May 2026 14:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B853C2BCB0;
 Mon, 11 May 2026 14:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778509952;
 bh=6yDaCsm6Fs9/qKu1KUmDi4lpZf7x22qyRdhvdJv9Oww=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=icPhxbc98tRXVJGF37J6eXmeRpm12v6pan1cFmoGM0830Cpvh691Wj04oH6/hPSox
 g6JS62vnM0lvZVuRfEF/xsyV7/un38Y+f6f9bxClpsCs5tS+1lyKmD14IsTMqR9dvJ
 bNhzafjdJYFJ53Psw9zHojjB+gPBQ8KC2YHV3xNgErJXfwkCYpOymSCjR5TtCmKA6O
 2lTZQdRweGWxqNGQqXY0+wh6gwQQVGe3ZFP0vIOzzEbpLyf2TWz0SdUMvNM54TfvnF
 0hCrtu8nHVnrmARng8NGBDlhXTjWjZuxl0HIw6cOsjQsRN33fzrNrbsOaxlfddQsGY
 AXQ6PTIJh9Ygg==
From: Mark Brown <broonie@kernel.org>
To: sunny.luo@amlogic.com, xianwei.zhao@amlogic.com, 
 neil.armstrong@linaro.org, khilman@baylibre.com, han.xu@nxp.com, 
 haibo.chen@nxp.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
 lhjeff911@gmail.com, hayashi.kunihiko@socionext.com, mhiramat@kernel.org, 
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, 
 Hans Zhang <18255117159@163.com>
In-Reply-To: <20260430155456.36998-1-18255117159@163.com>
References: <20260430155456.36998-1-18255117159@163.com>
Message-Id: <177850111749.988959.3324914194988461245.b4-ty@b4>
Date: Mon, 11 May 2026 21:05:17 +0900
MIME-Version: 1.0
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2369; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6yDaCsm6Fs9/qKu1KUmDi4lpZf7x22qyRdhvdJv9Oww=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqAeh8vjkGkzUWV0FtkGu3VAG7YFX76JbuewSvr
 7LFDYp1pNuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagHofAAKCRAk1otyXVSH
 0GgYB/0bjIyo5EXJiMTycuOQXtlDCYiBMJdMFY7I1IWduMD5RfXhniWXgWw9k/IIvjGySM8RXO0
 IIhV/HTwGFzjDO2SXcPM4W+Jr/8ZF7Qgw9SE0jEpgJN4OAvuq+Xik1N3z68utaNT1f6RduItRcE
 Zy7ES4g0a0t3V0NvEhMX9Mk5HL++3ycbAX6/3GtnZJOhFtHzPjYKbhhDxZiZYCsr+nKFTcHAFtq
 jT3ZRGgXQKN3xMnPqBBedkhZqWWNnhB8QIFZg64/HuIhb4jAla7PrY4zWwZ5cIdM2zeACsGa6EQ
 ddioBbSzHiHvztPDDNzxCiFvaq0EdY3ACBvex9ByywYEtj/R
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Cc: imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 00/10] spi: Use FIELD_MODIFY() for
	bitfield operations
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
X-Rspamd-Queue-Id: 40C4A510349
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sunny.luo@amlogic.com,m:xianwei.zhao@amlogic.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:han.xu@nxp.com,m:haibo.chen@nxp.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:lhjeff911@gmail.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:18255117159@163.com,m:imx@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[amlogic.com,linaro.org,baylibre.com,nxp.com,gmail.com,foss.st.com,socionext.com,kernel.org,googlemail.com,163.com];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_HAM(-0.00)[-0.564];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

On Thu, 30 Apr 2026 23:54:46 +0800, Hans Zhang wrote:
> spi: Use FIELD_MODIFY() for bitfield operations
> 
> Replace open-coded bitfield modifications with the standard FIELD_MODIFY()
> macro across multiple SPI controller drivers. This improves readability and
> adds compile-time checking without functional changes.
> 
> Each patch modifies a single driver, allowing independent review and
> application.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.2

Thanks!

[01/10] spi: amlogic-spifc-a1: Use FIELD_MODIFY()
        https://git.kernel.org/broonie/spi/c/8262b1421ddd
[02/10] spi: amlogic-spisg: Use FIELD_MODIFY()
        https://git.kernel.org/broonie/spi/c/b69bfa593329
[03/10] spi: cadence-xspi: Use FIELD_MODIFY()
        https://git.kernel.org/broonie/spi/c/6fa473f4c5dc
[04/10] spi: meson-spicc: Use FIELD_MODIFY()
        https://git.kernel.org/broonie/spi/c/cfdab17cd2d7
[05/10] spi: nxp-xspi: Use FIELD_MODIFY()
        https://git.kernel.org/broonie/spi/c/0f2efc6d4938
[06/10] spi: sn-f-ospi: Use FIELD_MODIFY()
        https://git.kernel.org/broonie/spi/c/579fcc06576d
[07/10] spi: stm32-ospi: Use FIELD_MODIFY()
        https://git.kernel.org/broonie/spi/c/21ee6902a576
[08/10] spi: stm32-qspi: Use FIELD_MODIFY()
        https://git.kernel.org/broonie/spi/c/3e0530c087a9
[09/10] spi: sunplus-sp7021: Use FIELD_MODIFY()
        https://git.kernel.org/broonie/spi/c/673214ac9bcd
[10/10] spi: uniphier: Use FIELD_MODIFY()
        https://git.kernel.org/broonie/spi/c/ce7984bea2a1

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
