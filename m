Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHKmH8LWwWkaXQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2026 01:11:46 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E09B2FF61E
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2026 01:11:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C13D4C87EC5;
	Tue, 24 Mar 2026 00:11:45 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C28FBC5A4C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 00:11:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B31D0600C4;
 Tue, 24 Mar 2026 00:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57BE8C2BC9E;
 Tue, 24 Mar 2026 00:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774311103;
 bh=Di5mcPNb0r2N+QWMH4UxyuhE6p8fkYgO2pkH90SHdT4=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=f7r1JImQB/SRvnQqdQ62Ik0ATXOFu5eMEUFc4YTTBMHtSqYJ2gVutAKIN/VqjZyeF
 P2sWCb8H6rrSfm5Knf95lClTIk/6qD2abXnr5aBhHVu/X67jk+7F9AYilQBE84u2yA
 rT39OWjQR0xJvp7VaLbyF2OcpkWudRMK2uWc0MlRJDN9EvAQ0LyuFLkhCgUNPFBo/b
 1oxbwvUphkldddonytnk1kx6CJ8qHHZnUTDKibToHOrTSl1x+lGlVT1gCXFfpcXSq7
 SZtrQQi3Hgc7YNXvUJ+sD/K4XIhpBirnHXziunLrPKWxYxlEVUSz0YcQq0/YACipLq
 qa0h0Sq6mV5BQ==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, openbmc@lists.ozlabs.org, 
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, Frank.Li@nxp.com, 
 amelie.delaunay@foss.st.com, Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <cover.1773885292.git.xiaopei01@kylinos.cn>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
Message-Id: <177429527684.757727.3178430227590182148.b4-ty@b4>
Date: Mon, 23 Mar 2026 19:47:56 +0000
MIME-Version: 1.0
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=openpgp-sha256; l=2226; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Di5mcPNb0r2N+QWMH4UxyuhE6p8fkYgO2pkH90SHdT4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpwda8CnOiOloYzFySgYbCE/6hff/7Co6oZovH/
 NYX07fdL5eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacHWvAAKCRAk1otyXVSH
 0NvUB/4tGt133fOvYsd5ccQQIQOzVbVHSDtwT2WLeR3+X0YErOBbugNfEdY+SSuDTTx5dvleDwv
 RRu/m16aqCnbltqs+xqYo0EXuNKhb/EH7dIXDpbBvc/66u5FoNCTIqeF5Jfab/mZBDBQKddVugr
 5e0Weu5eT9FYS5UydoOJLtwKzXRKlT0OeLmLgYIV5CuL4HKShuJNQ4VHb1+VsVS74JesMhW3FZL
 e9cayQAVBijhwh//ogTcJasWpFIG0iF14Lf9dGiYeeZalKEWH9KveHB6VChUAjuE75JWrl/xt0a
 8vEuC/a9d+boVY7I08rDLiYeqO164RdPm5UbQvrxTWXR5C9G
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Subject: Re: [Linux-stm32] (subset) [PATCH v5 00/17] cleanup in spi by use
 devm_clk_get_enabled
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
X-Spamd-Result: default: False [3.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:linux-spi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:openbmc@lists.ozlabs.org,m:linux-rockchip@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:Frank.Li@nxp.com,m:amelie.delaunay@foss.st.com,m:xiaopei01@kylinos.cn,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 1E09B2FF61E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 19 Mar 2026 10:03:56 +0800, Pei Xiao wrote:
> cleanup in spi by use devm_clk_get_enabled
> 
> I know that many old SPI drivers should not be modified for hardware
> stability and to reduce maintenance effort. But I can't help cleaning them
> up. To minimize the introduction of issues, I tried not to modify the
> timing of those hardware clock enables.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.1

Thanks!

[02/17] spi: bcm63xx-hsspi: Simplify clock handling with devm_clk_get_enabled()
        https://git.kernel.org/broonie/spi/c/e532e21a246d
[03/17] spi: bcmbca-hsspi: Simplify clock handling with devm_clk_get_enabled()
        https://git.kernel.org/broonie/spi/c/8b237cb10e32
[09/17] spi: sifive: Simplify clock handling with devm_clk_get_enabled()
        https://git.kernel.org/broonie/spi/c/140039c23aca
[13/17] spi: stm32: Simplify clock handling with devm_clk_get_enabled()
        https://git.kernel.org/broonie/spi/c/7da637804805
[14/17] spi: sunplus-sp7021: Simplify clock handling with devm_clk_get_enabled()
        https://git.kernel.org/broonie/spi/c/ea0e916de134
[15/17] spi: uniphier: Simplify clock handling with devm_clk_get_enabled()
        https://git.kernel.org/broonie/spi/c/fbf34af0c6eb
[16/17] spi: zynq-qspi: Simplify clock handling with devm_clk_get_enabled()
        https://git.kernel.org/broonie/spi/c/c9a4136c4746

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
