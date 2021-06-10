Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A7D3A36E4
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jun 2021 00:15:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 317D1C58D5B;
	Thu, 10 Jun 2021 22:15:20 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0038.hostedemail.com
 [216.40.44.38])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 678B6C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jun 2021 22:15:18 +0000 (UTC)
Received: from omf16.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id F1676837F24C;
 Thu, 10 Jun 2021 22:15:16 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf16.hostedemail.com (Postfix) with ESMTPA id 2C534255104; 
 Thu, 10 Jun 2021 22:15:04 +0000 (UTC)
Message-ID: <fa180c7093b946f2bd86d26d5875db28f80957de.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: trix@redhat.com, robh+dt@kernel.org, tsbogend@alpha.franken.de, 
 jic23@kernel.org, lars@metafoo.de, tomas.winkler@intel.com, arnd@arndb.de, 
 gregkh@linuxfoundation.org, nbd@nbd.name, lorenzo.bianconi83@gmail.com, 
 ryder.lee@mediatek.com, kvalo@codeaurora.org, davem@davemloft.net,
 kuba@kernel.org,  matthias.bgg@gmail.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com,  apw@canonical.com, dwaipayanray1@gmail.com,
 lukas.bulwahn@gmail.com,  chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
 zhangqing@loongson.cn,  jbhayana@google.com, sean.wang@mediatek.com,
 shayne.chen@mediatek.com,  Soul.Huang@mediatek.com, shorne@gmail.com,
 gsomlo@gmail.com,  pczarnecki@internships.antmicro.com,
 mholenko@antmicro.com, davidgow@google.com
Date: Thu, 10 Jun 2021 15:15:02 -0700
In-Reply-To: <20210610214438.3161140-3-trix@redhat.com>
References: <20210610214438.3161140-1-trix@redhat.com>
 <20210610214438.3161140-3-trix@redhat.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.56
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 2C534255104
X-Stat-Signature: hbs5edjb7ssp137oygbp83agndwobmm6
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX188Q7ACCxeE8e0t3mWcK2DFYS2XGLRcOCk=
X-HE-Tag: 1623363304-278120
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/7] checkpatch: check Makefiles and
 Kconfigs for SPDX tag
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, 2021-06-10 at 14:44 -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> =

> Both Makefiles and Kconfigs should carry an SPDX tag.
> Something like
> =A0# SPDX-License-Identifier: GPL-2.0-only
> =

> Add a matcher to existing check
> =

> Signed-off-by: Tom Rix <trix@redhat.com>

Seems fine, thanks.

There's a Makefile with two tags that could be updated too.
---
 drivers/staging/media/atomisp/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media=
/atomisp/Makefile
index 51498b2e85b8f..cee03e31f420d 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -11,7 +11,6 @@ DEFINES +=3D -DDEBUG
 =

 atomisp =3D $(srctree)/drivers/staging/media/atomisp/
 =

-# SPDX-License-Identifier: GPL-2.0
 atomisp-objs +=3D \
 	pci/atomisp_acc.o \
 	pci/atomisp_cmd.o \


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
