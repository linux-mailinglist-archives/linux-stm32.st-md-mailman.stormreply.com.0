Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DECD93C3582
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Jul 2021 18:20:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E847C57B60;
	Sat, 10 Jul 2021 16:20:56 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18395C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Jul 2021 16:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ojyIBwloAwMN6eYxqUMzZGXJG9Wtq+1qb9RbHTEv0ks=; b=D5orH/qmYnTHFv9PZnhKELEg1v
 kBSwdw3LQ1+4fczyjKmkhtc4JCNSTCL2CE7/mRck/3Av+HWFn/LDBMCyi8kuEgbqVmPssgmZVEzP6
 TRnqYIoi5NdgWVTWn1zOHSgbAmUf8uH4kIdMg6W6r4M0CMx0xsyqrqEZV7k75EanUU+OsdvqfLiY2
 qZRCElDSt12DRF3MWNC5XjGMWDCYVaLM3sPDATLhB6zhaL9ZrrH2ZILIxz/rGQwEJhBxv/7vRIq1C
 iTHzfIHWbxFKN0Nd7Vq7gvZ+FOrrVa48QdCf3RL1poxdeZpSpFLSiUvkzRkrl3hQh5tRamLrEZ5Uk
 7jQ10yWg==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:46202 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <david@lechnology.com>)
 id 1m2FiV-00GbOP-2s; Sat, 10 Jul 2021 12:20:50 -0400
To: William Breathitt Gray <vilhelm.gray@gmail.com>, jic23@kernel.org
References: <cover.1625471640.git.vilhelm.gray@gmail.com>
 <472b3f1cce1bbfedd2031cdb70d0348f3802e821.1625471640.git.vilhelm.gray@gmail.com>
From: David Lechner <david@lechnology.com>
Message-ID: <a9bc17fa-2ba0-027c-2ad8-99e4e6a03b2a@lechnology.com>
Date: Sat, 10 Jul 2021 11:20:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <472b3f1cce1bbfedd2031cdb70d0348f3802e821.1625471640.git.vilhelm.gray@gmail.com>
Content-Language: en-US
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
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, mcoquelin.stm32@gmail.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 o.rempel@pengutronix.de, jarkko.nikula@linux.intel.com,
 Dan Carpenter <dan.carpenter@oracle.com>, kernel@pengutronix.de,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v12 13/17] counter: Implement
 signalZ_action_component_id sysfs attribute
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

On 7/5/21 3:19 AM, William Breathitt Gray wrote:
> The Generic Counter chrdev interface expects users to supply component
> IDs in order to select Synapses for requests. In order for users to know
> what component ID belongs to which Synapse this information must be
> exposed. The signalZ_action_component_id attribute provides a way for
> users to discover what component ID belongs to the respective Synapse.
> 
> Cc: David Lechner <david@lechnology.com>
> Cc: Gwendal Grignou <gwendal@chromium.org>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---

I like this better than having to scrape the number from the
attribute name.

Reviewed-by: David Lechner <david@lechnology.com>

> +	/* Allocate Counter attribute */
> +	counter_attr = devm_kzalloc(dev, sizeof(*counter_attr), GFP_KERNEL);

nit: Comments like this are redundant and can be omitted. All 3 words
in the comment are literally (abbreviated) in the next line of code so
it doesn't add any new/useful information.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
