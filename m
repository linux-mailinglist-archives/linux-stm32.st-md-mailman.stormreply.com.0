Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1886D1BA36
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 23:57:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CA9FC8F26D;
	Tue, 13 Jan 2026 22:57:27 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 960E1C5A4EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 22:57:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5BD5160018;
 Tue, 13 Jan 2026 22:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D34C116C6;
 Tue, 13 Jan 2026 22:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768345044;
 bh=/VOHhg+BGXPkNRZ89eA1uek4P5riQp1mlGx8ZixiYbo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XFdasWx5pC6fVJ1H8GZcX26x6Gj49Z3Eo2u2mv3//WQIHweZaauLn9+EwlX7pcU+M
 066YUvqnxHXqVwFrvOJa0o6C/tLjve6l3sI794elsbdVtASK3YJM3Y8fAAse+pnnrU
 SMwNf3uJNb66kwi4v9DatKsP4SMLUQhjrl/j14qpKIt27fhc3p/OLqsBbBKk9e1B3J
 DcJxKg2XKFYlJR7qWSiEGTcLs8cc0sGYQvL8l6cxaAcDUGiP42ltDO5n5l2GEh6/R+
 ANdgMjn5VOUd1wNyr9Z9MXLKQRDA03EKsMRdi4s9eENmZGytvE0etq8fgKmMBNPacV
 GbcO9kPVEhiQg==
Date: Tue, 13 Jan 2026 16:57:23 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <176834504228.390747.7474815974148199421.robh@kernel.org>
References: <20260108-remove_ocp-v3-0-ea0190244b4c@kernel.org>
 <20260108-remove_ocp-v3-3-ea0190244b4c@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108-remove_ocp-v3-3-ea0190244b4c@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 bsp-development.geo@leica-geosystems.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mamta Shukla <mamta.shukla@leica-geosystems.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 3/3] dt-bindings: net: altr,
 socfpga-stmmac: remove TODO note
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


On Thu, 08 Jan 2026 07:08:11 -0600, Dinh Nguyen wrote:
> The 'stmmaceth-ocp' will no longer be used as a reset-name, going forward
> and 'ahb' shall be used.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
> v3: Addressed Rob Herring's comments and updated commit header/message
> v2: Introduced
> v1: n/a
> ---
>  Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
