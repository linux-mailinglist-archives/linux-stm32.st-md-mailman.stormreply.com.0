Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A29A0898B
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 09:09:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 267F9C71292;
	Fri, 10 Jan 2025 08:09:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 177B6C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 08:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736496541; x=1768032541;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0vZxoqsAEaUyi0cIZM9avr4/Zblqn0Qq4dg6nBL6UVs=;
 b=heg0jLxT8Kxrregmc3Bcr4IAlXsjBUKMbMVRzmQkk0sZek4mJITXt7+4
 qgRI1+Gy/kKY3prf1stEeEWa/eXvF60kIfFJivgkm9uixjlLhzYZ6SCOq
 2ja+CBuE3aOTzgVAZ1PebDXOnkhU5Ha0rE9l72OmNteBkZp8xvZj3Lux3
 eZ2EObsxBcTF2h8Cdvn7w8RiLvXhYamUGj/GVyWPk/qGlXw1xn7LOpkom
 1hJ2d2kA17P7i/33uyk6H38TweueSZayheTmDWon+wnQEqZ+szZ6wusLf
 uPtonhuB2AKcbpU7alRD6u/+11RIbsfR/j6I0gPrJa4b6hmvNzZcFSZSJ A==;
X-CSE-ConnectionGUID: gMG4bJbmR6Omq4Lf/at6tg==
X-CSE-MsgGUID: N/1etQlDT0ihZaD14PYwLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="62154032"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="62154032"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 00:08:53 -0800
X-CSE-ConnectionGUID: guE/BhWbT7q99Q6DlK+Jqg==
X-CSE-MsgGUID: AG7Q+tLwTymHN1MgC8HhnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="104185433"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com)
 ([10.237.72.44])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 00:08:50 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
 by kekkonen.fi.intel.com (Postfix) with SMTP id 2AF3A11F89A;
 Fri, 10 Jan 2025 10:08:47 +0200 (EET)
Date: Fri, 10 Jan 2025 08:08:47 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <Z4DVj9ubGkAmkZKN@kekkonen.localdomain>
References: <20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 0/8] media: stm32: csi / dcmipp
	corrections
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

Hi Alain,

On Wed, Jan 08, 2025 at 02:16:03PM +0100, Alain Volmat wrote:
> Various fixes within the stm32 csi bindings/drivers and
> stm32 dcmipp driver.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Thanks for the update. I tried to apply this but it doesn't, and the
culprit appears to be this line in dcmipp_graph_notify_bound():

	unsigned int ret;

That appears to be a bug as such. The interesting thing is that the patch
changing things around it presumes

	int ret;

so it won't apply. Do you already have a patch that fixes it? It should be
cc'd to stable, too, with a Fixes: tag.

-- 
Regards,

Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
