Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 651AB2C3D1E
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Nov 2020 11:02:32 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23849C5662F;
	Wed, 25 Nov 2020 10:02:32 +0000 (UTC)
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E03DC3089F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Nov 2020 20:03:56 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fbc15a70004>; Mon, 23 Nov 2020 12:03:51 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Nov
 2020 20:03:49 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Mon, 23 Nov 2020 20:03:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gITd84wMHHzcOptjQRg1Bi4wKYLoloErjGXTzbxbsYYxXpRm6DfDjP1G8JsqPPruG8n8djHpWT3ChykgCoTQdTlPHkj05TPw7WZ4Y46HlI8bprZC3XuF3n009Te/qaTwPxc9ef3s3wxgnUStlvtZrJvP5WQhh3MIKLFTGEWjhLXWcgs1VmoV9q6ndrBwWgPhsRBIC9rKh9qqm9cf9Ujr9sks/ml2cZ4bW16uPSJVifE1ke5RuUikXPZ60YcpNVw15sbmeBPfJ8v059YAkVfr8AOpsBgi+OymMySTg/JYVNFtVJ2pGo3M9pC5txLp474ztgTCR2D9RfvqUQOXT+42RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QophqWBVIGhmInjMMmoN1JCz5yEuED07MVw87J8AVUY=;
 b=dpOj+p56VpZQgFejSTc+TjZx9PpIbmIlWcJPfXyA8QiV6hyerQ1PNIg37pZm/OoPMM7dRNU+MPO2Sxmva5Z6iKtLQpQNkcM79tS52of8WjxHEmReB+Qc/VB0gzy26dU2FtXMoEzn5Rx6YHRp97uhlWeSk7Nsi1BUrieORD+G9yqkgKBmwQvC726s6EkJ0s32uNc7iMGffyCjKbyBtSLggJX9G9WEJ0m0GYQlYWRE7aVXL+Iy16bXoksvn7nW7YXP74v45GAqxPt7EElquzCZ4kXurFfWXXWM9ThsUobGLm/yb7wWVAmTEM+ttWZwc1mR7P3I+RsId2H9o2Xiqq+zAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4338.namprd12.prod.outlook.com (2603:10b6:5:2a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Mon, 23 Nov
 2020 20:03:48 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::e40c:730c:156c:2ef9]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::e40c:730c:156c:2ef9%7]) with mapi id 15.20.3589.022; Mon, 23 Nov 2020
 20:03:48 +0000
Date: Mon, 23 Nov 2020 16:03:45 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Message-ID: <20201123200345.GA38546@nvidia.com>
References: <cover.1605896059.git.gustavoars@kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
X-ClientProxiedBy: MN2PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:208:23a::18) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR03CA0013.namprd03.prod.outlook.com (2603:10b6:208:23a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Mon, 23 Nov 2020 20:03:47 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1khI3t-000A35-Tb; Mon, 23 Nov 2020 16:03:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1606161831; bh=QophqWBVIGhmInjMMmoN1JCz5yEuED07MVw87J8AVUY=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=Zr1EZlr7FGouweCXJ2A3YJZ8lxsTazMwmiIDkNNgeYuPc4M3hA0h9guNHLXrnnLeX
 Dp0jtpGLpYuZZsYit0m8+Y/3Pgk+U78P2KDuhjfei0oh+kHbQnRfzB2jD1Wu7rVyZ8
 A2iuCgvA8hhwNVx8Bo/l4LfRAECKvf8eJj6um7c8+wyJ6oFgyijvPixB8Xcq6YNTLj
 o7o09Zdo2SkPJV9Ld82VvGAW1KENwGx8qxL8L4kHw5xGizl/kk/4FLfOCs8mx17bXD
 N2PIS7AsaPoH2bHogxWrZ7vcH6YOCMGYKk/oZQ1BhSoaDoH96AMZAs9BCirfcyYEMq
 3EMRDyReptNPA==
X-Mailman-Approved-At: Wed, 25 Nov 2020 10:02:30 +0000
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
 reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Nathan Chancellor <natechancellor@gmail.com>, linux-ide@vger.kernel.org,
 dm-devel@redhat.com, keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
 samba-technical@lists.samba.org, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
 usb-storage@lists.one-eyed-alien.net, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 rds-devel@oss.oracle.com, Nick Desaulniers <ndesaulniers@google.com>,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
 linux-security-module@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, cluster-devel@redhat.com,
 linux-acpi@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, tipc-discussion@lists.sourceforge.net,
 linux-ext4@vger.kernel.org, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-geode@lists.infradead.org, linux-can@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
 xen-devel@lists.xenproject.org, nouveau@lists.freedesktop.org,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 x86@kernel.org, linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com,
 Kees Cook <keescook@chromium.org>, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-sctp@vger.kernel.org, linux-usb@vger.kernel.org,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, target-devel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 000/141] Fix fall-through warnings for
	Clang
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

On Fri, Nov 20, 2020 at 12:21:39PM -0600, Gustavo A. R. Silva wrote:

>   IB/hfi1: Fix fall-through warnings for Clang
>   IB/mlx4: Fix fall-through warnings for Clang
>   IB/qedr: Fix fall-through warnings for Clang
>   RDMA/mlx5: Fix fall-through warnings for Clang

I picked these four to the rdma tree, thanks

Jason
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
