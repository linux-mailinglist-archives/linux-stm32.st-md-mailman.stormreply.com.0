Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF791EBEE6
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jun 2020 17:18:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CC88C36B21;
	Tue,  2 Jun 2020 15:18:17 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 672EBC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jun 2020 15:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fY5IJpcG4taKk/Z1c0/fQ/EvxTolmAQsbeDYBoiR5u0=; b=NtLZtOksQBZaiN/MHofooBohHZ
 yLz+q25OmAY1J1RyUf0/feKCObejImLWtjna8ZQ0uxzyiM0BFAN0yDX/su6TOIdUcGIecBhnEROeu
 rKnMT7PBoOjCgJ5vb0Q1/WYMJJsUi2fad3XkcM2aAX+rmw/oQuHeYgFayIW4DHtjZWCjL0C0JdloA
 EJmFEPCJYbcI0E3MvqUidpxpBsP5vMLJIC0bAfadEuogsfdlzjtG4dLbE1H49nR1ApyieO4qyGQR9
 awbtgQdycWeGLXshgfJT6uoHQIWbLdvRkNat/h/qg5GQs2Rac1w5nmqgjHRft6HUE3aaBO749uASj
 s3W/P9fQ==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:42134 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <david@lechnology.com>)
 id 1jg8g5-00049A-Lh; Tue, 02 Jun 2020 11:18:09 -0400
To: William Breathitt Gray <vilhelm.gray@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
References: <cover.1589654470.git.vilhelm.gray@gmail.com>
 <20200524172542.31ff6ac7@archlinux> <20200524175439.GA14300@shinobu>
 <20200531161813.658ffdfb@archlinux> <20200531171351.GA10597@shinobu>
From: David Lechner <david@lechnology.com>
Message-ID: <ac473c9a-f9cd-21ae-8f8f-d5181df2c134@lechnology.com>
Date: Tue, 2 Jun 2020 10:18:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200531171351.GA10597@shinobu>
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
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/4] Introduce the Counter character
	device interface
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

On 5/31/20 12:14 PM, William Breathitt Gray wrote:
> Yielding the following /dev/counter0 memory layout:
> 
> +------------+-----------------+------------+-------------------+
> | Byte 0     | Byte 1 - Byte 8 | Byte 9     | Byte 10 - Byte 17 |
> +------------+-----------------+------------+-------------------+
> | Boundary 0 | Count 0         | Boundary 1 | Count 1           |
> +------------+-----------------+------------+-------------------+

A potential pitfall with this sort of packing is that some platforms
do not support unaligned access, so data would have to be "unpacked"
before it could be used.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
