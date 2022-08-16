Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE927595D7F
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Aug 2022 15:37:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EF14C5E2C2;
	Tue, 16 Aug 2022 13:37:52 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DEC4C03FEA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Aug 2022 13:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e/P0dZRVpx52m88paCNMNBZULrSwc01U661inww9QsU=; b=dAkQZjGmyeiMijnr1kaFmUYc7Z
 rhU2n+/3qXOA73chZadip7JBKrTxHD9lCube0YK7xTL9Vrr81Jcjr4Wn51G70wXNolnXPJrGOL9xQ
 VQDY6cZ9QmAkkT21DHZ+j4PmKAjg7vnHiz2So2XNLnP4gNMe1zJNR9WImdISvG486PnAH/RSxL9FS
 XUHjGIAxh81nOvFRVuyn5MucSSJJ3+BB92XxstegQcLbLWdXQx2PWC4SF7G1XBf1YtJUgSUNYbYFH
 miQICmEem4emk6wcFgxLMWVVaghGvmker2M7/FDpBtIGfq1LwUhcQfPfY8kwoVFuvQxZil2XDF4jy
 J+97E1Zg==;
Received: from [2600:1700:4830:1658::fb2] (port=38832)
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.95)
 (envelope-from <david@lechnology.com>) id 1oNwlO-0000Xz-03;
 Tue, 16 Aug 2022 09:37:47 -0400
Message-ID: <5d816181-65f1-0102-0faa-8940509ef0d3@lechnology.com>
Date: Tue, 16 Aug 2022 08:37:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: William Breathitt Gray <william.gray@linaro.org>, linux-iio@vger.kernel.org
References: <20220815220321.74161-1-william.gray@linaro.org>
From: David Lechner <david@lechnology.com>
In-Reply-To: <20220815220321.74161-1-william.gray@linaro.org>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - st-md-mailman.stormreply.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 linux-kernel@vger.kernel.org, Oleksij Rempel <linux@rempel-privat.de>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] counter: Move symbols into COUNTER
	namespace
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 8/15/22 5:03 PM, William Breathitt Gray wrote:
> Counter subsystem symbols are only relevant to counter drivers. A
> COUNTER namespace is created to control the availability of these
> symbols to modules that import this namespace explicitly.
> ---


Acked-by: David Lechner <david@lechnology.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
