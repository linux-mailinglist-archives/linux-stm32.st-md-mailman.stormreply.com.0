Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C051C23EE9
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Oct 2025 09:54:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A429C62D99;
	Fri, 31 Oct 2025 08:54:13 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A446FC5F1F0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Oct 2025 08:54:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9436540BD3;
 Fri, 31 Oct 2025 08:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0ADAC4CEF1;
 Fri, 31 Oct 2025 08:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761900850;
 bh=Lw7yF10xMLzuOE0JXvv0x2sq04lm1fFuwSZpHCOq9mU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G7+hjfxtbZHKoqcFjOPoLfaXzVymj6iAzO+1+my+UGN9xQzo2tbNW0nIZ2hVNb5mz
 7oe+qGdpTg/PDFq7EJD3H5eyhEfTwTGX55+0Yt95ZIyKHPI7hN7/43Ap3OrgOPtmTO
 n+JG7SR6NfhvVrfb7HpyQJzeFHTjfGuv3yQTKqDuVU+/U7WnzDkQyj0hyC7iZzvvrO
 g2dUM5EqkWRGV1s8VcxVUpbTjgp3IUu60ALra2NYWkb1kQrosb2ppgEDxRV5ARZrVA
 7SXhjjIBZK8Zyf5I6fNO0T2IUpUkN/OEDoTHbLICjWUEG9WsrJ3/K77wpMOsdjCIsX
 5b66IiXsWzOKQ==
Date: Fri, 31 Oct 2025 09:54:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: weishangjuan@eswincomputing.com
Message-ID: <20251031-enthusiastic-rugged-aardwolf-a5ceb8@kuoka>
References: <20251030085001.191-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251030085001.191-1-weishangjuan@eswincomputing.com>
Cc: vladimir.oltean@nxp.com, edumazet@google.com, jszhang@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 ningyu@eswincomputing.com, 0x1207@gmail.com, lizhi2@eswincomputing.com,
 kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org,
 jan.petrous@oss.nxp.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, boon.khai.ng@altera.com,
 mcoquelin.stm32@gmail.com, inochiama@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: ethernet: eswin: fix yaml
	schema issues
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

On Thu, Oct 30, 2025 at 04:50:01PM +0800, weishangjuan@eswincomputing.com wrote:
> From: Shangjuan Wei <weishangjuan@eswincomputing.com>
> 
> Due to the detection of errors in the eswin mmc module
> regarding the eswin,hsp-sp-csr attributes in the
> eswin,eic7700-eth.yaml file, the link is as follows:
> https://lore.kernel.org/all/176096011380.22917.1988679321096076522.robh@kernel.org/
> Therefore, the eswin,hsp-sp-csr attributes of the eic7700-eth.yaml file
> regarding eswin and hsp-sp-csr will be changed to the form of:

Ach, and you forgot net or net-next subject prefix, depending which
branch/cycle you target. See submitting patches and this subsystem
maintainer profile document.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
