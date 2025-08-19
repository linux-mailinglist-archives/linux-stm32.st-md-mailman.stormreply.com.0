Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FF4B2C659
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Aug 2025 15:58:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C45AC3F949;
	Tue, 19 Aug 2025 13:58:55 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD85CC3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 13:58:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A670061431;
 Tue, 19 Aug 2025 13:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D132C113D0;
 Tue, 19 Aug 2025 13:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755611932;
 bh=qegJliyCwkUB9tOPFffvUwCm+VjLhHymTL03rrMDI5E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ogb6q3ZxsL3Pf7yxU+Ivavw47aEkHyn6W67vp/gW2ryEY2aT1erv92eZDsgI93gyw
 TUbV0UdJocFNzVMVDhCJBhN6TTR6kgb9CWbXmnkHDJ32h5noBnG1o+lKSfq3nzwolj
 pUv4xkFm/SjjfdGdfqCByMyTIMn455kOkLKdey9PklYOBtmSQ4+VDF0w0d6hANFkqG
 w5ER7HiAWHgexqotU6+kAkL4QK7vtp4wZSlWNxwes84YDX6Mo83TJq8hRxVv3w2MKV
 uHaWtHsVxBH3hgYtPK+5iuyE4m9x7cMtbrpgY/wqv+JUSGd61NJgonfKRg2qGUGtOC
 Cs2gCsTz96QxA==
Date: Tue, 19 Aug 2025 08:58:51 -0500
From: Rob Herring <robh@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Message-ID: <20250819135851.GA115029-robh@kernel.org>
References: <20250819-drm-misc-next-v3-0-04153978ebdb@foss.st.com>
 <20250819-drm-misc-next-v3-1-04153978ebdb@foss.st.com>
 <175560127037.3969097.6130940505156039734.robh@kernel.org>
 <e144225c-e0e6-4d3e-a4d8-e4c48cdef3f6@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e144225c-e0e6-4d3e-a4d8-e4c48cdef3f6@foss.st.com>
Cc: Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 01/13] dt-bindings: display: st: add
 new compatible to LTDC device
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

On Tue, Aug 19, 2025 at 03:17:46PM +0200, Raphael Gallais-Pou wrote:
> 
> 
> On 8/19/25 13:01, Rob Herring (Arm) wrote:
> > On Tue, 19 Aug 2025 11:15:54 +0200, Raphael Gallais-Pou wrote:
> >> The new STMicroelectronics SoC features a display controller similar to
> >> the one used in previous SoCs.  Because there is additional registers,
> >> it is incompatible with existing IPs.
> >>
> >> Add the new name to the list of compatible string.
> >>
> >> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> >> ---
> >>  .../devicetree/bindings/display/st,stm32-ltdc.yaml | 30 ++++++++++++++++++++--
> >>  1 file changed, 28 insertions(+), 2 deletions(-)
> 
> Hi Rob,
> 
> It seems several patches of this series triggered your bot without
> warnings/errors messages.
> 
> Did I missed something or is it just a glitch in the matrix ? :)

'make dt_binding_check' is broken in linux-next which is used if the 
base commit is not specified or not found. The latter was the case here. 
Should be fixed in tomorrow's linux-next.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
