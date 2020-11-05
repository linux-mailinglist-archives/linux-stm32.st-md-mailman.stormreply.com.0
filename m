Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0892A794B
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Nov 2020 09:30:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 224CAC32E90;
	Thu,  5 Nov 2020 08:30:05 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 458C6C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Nov 2020 08:30:01 +0000 (UTC)
IronPort-SDR: fpijHtxvbVWnFG4Ijpgj3L/ZBHGfxTgjr51N3WLdWZk3d5rCtRUDD9aXqP+baP5XyPn/Jyf1xk
 1reiSwshG0Vw==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="149200463"
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="149200463"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 00:29:59 -0800
IronPort-SDR: bIpWq1MLoGbvv+4fLB/sb1nvEAbF/YGJYWVHJmiYLBDG12K4o23kaNDfCyCukglqXZYbgG63yr
 BK6hOCaBOnEw==
X-IronPort-AV: E=Sophos;i="5.77,453,1596524400"; d="scan'208";a="306758610"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2020 00:29:54 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 4B1AE20901; Thu,  5 Nov 2020 10:29:51 +0200 (EET)
Date: Thu, 5 Nov 2020 10:29:51 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hugues Fruchet <hugues.fruchet@st.com>
Message-ID: <20201105082951.GY26150@paasikivi.fi.intel.com>
References: <1604511132-4014-1-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604511132-4014-1-git-send-email-hugues.fruchet@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Alain Volmat <alain.volmat@st.com>,
 Rob Herring <robh+dt@kernel.org>, Yannick Fertre <yannick.fertre@st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 0/4] DCMI BT656 parallel bus mode
	support
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

Hi Hugues,

On Wed, Nov 04, 2020 at 06:32:08PM +0100, Hugues Fruchet wrote:
> Add support of BT656 embedded synchronization bus.
> This mode allows to save hardware synchro lines hsync & vsync
> by replacing them with synchro codes embedded in data stream.
> Add "bus-type" property and make it required so that there is no
> ambiguity between parallel mode (bus-type=5) and BT656 mode (bus-type=6).

Thanks for the update.

Regarding the two last patches, which tree they're intended to go to?
Something else than media? I can also take them if it's ok for the
maintainer of the "right" tree.

-- 
Kind regards,

Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
