Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9663AE68D
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jun 2021 11:54:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24749C57183;
	Mon, 21 Jun 2021 09:54:36 +0000 (UTC)
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 795E0C58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jun 2021 09:54:35 +0000 (UTC)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1lvGd7-000490-01; Mon, 21 Jun 2021 11:54:09 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 7E0F4C071C; Mon, 21 Jun 2021 11:46:02 +0200 (CEST)
Date: Mon, 21 Jun 2021 11:46:02 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: trix@redhat.com
Message-ID: <20210621094602.GB4425@alpha.franken.de>
References: <20210610214438.3161140-1-trix@redhat.com>
 <20210610214438.3161140-6-trix@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210610214438.3161140-6-trix@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: zhangqing@loongson.cn, mholenko@antmicro.com, linux-iio@vger.kernel.org,
 alexandre.torgue@foss.st.com, jiaxun.yang@flygoat.com,
 linux-kernel@vger.kernel.org, matthias.bgg@gmail.com, netdev@vger.kernel.org,
 shorne@gmail.com, lars@metafoo.de, chenhuacai@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, gsomlo@gmail.com,
 linux-arm-kernel@lists.infradead.org, pczarnecki@internships.antmicro.com,
 lukas.bulwahn@gmail.com, tomas.winkler@intel.com, devicetree@vger.kernel.org,
 arnd@arndb.de, sean.wang@mediatek.com, ryder.lee@mediatek.com,
 linux-mediatek@lists.infradead.org, davidgow@google.com, kuba@kernel.org,
 apw@canonical.com, Soul.Huang@mediatek.com, kvalo@codeaurora.org,
 jbhayana@google.com, lorenzo.bianconi83@gmail.com, gregkh@linuxfoundation.org,
 linux-wireless@vger.kernel.org, linux-mips@vger.kernel.org, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, dwaipayanray1@gmail.com, joe@perches.com,
 shayne.chen@mediatek.com, davem@davemloft.net, jic23@kernel.org, nbd@nbd.name
Subject: Re: [Linux-stm32] [PATCH 4/7] MIPS: Loongson64: fix spelling of
	SPDX tag
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

On Thu, Jun 10, 2021 at 02:44:35PM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> checkpatch looks for SPDX-License-Identifier.
> So change the '_' to '-'
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  arch/mips/boot/dts/loongson/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
