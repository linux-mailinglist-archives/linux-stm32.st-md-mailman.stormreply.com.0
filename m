Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9108079053D
	for <lists+linux-stm32@lfdr.de>; Sat,  2 Sep 2023 07:24:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 446D0C6A61D;
	Sat,  2 Sep 2023 05:24:58 +0000 (UTC)
Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com
 [162.62.57.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DB34C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Sep 2023 05:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1693632283;
 bh=f3BahJ0f5WwmfyARP2+MMnay33J1y6FDk8/4avkW738=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=wpF6JS6KXAIr8io0RvELG1G1Oys49Tc+uSHboZ5n8XMkp/wVMIGbetuMxq2LdXj0G
 iaS0aAH7GXlKTa1Um8UByGQUUF53ler/u2lPAX0iQ5etjPKHqdxVwYN1aj+LZAzMJZ
 MF2ExR5BD0MwLxXSmjCLMymfnscNceLUTxZ8MS5w=
Received: from rtoax.lan ([120.245.114.63])
 by newxmesmtplogicsvrsza12-0.qq.com (NewEsmtp) with SMTP
 id 62613CE1; Sat, 02 Sep 2023 13:24:38 +0800
X-QQ-mid: xmsmtpt1693632278tgbiug7q4
Message-ID: <tencent_2B465711F30DC88514B2842F1D54005E8109@qq.com>
X-QQ-XMAILINFO: NEq0i4SycP3b8o/n7e9Utp3j5PTmzMk0VaaageYuv1vGOoNomrBZd0QBV4XFjx
 hZmvIstl+9IdjzOFT4q5vHpMJrX9JS537Q04Ru2XnY1ZESIh4KDAdN5ipHlYk6zUf4DTN4jd/5aE
 SxZM2g651a3hquWEm0yolNVZazQ7iqYeHJ37R3RYnf+bH7UC85rfiwL8PeE5JHLG4vWBxWEn9pod
 k/uFDmwX76qXG2ou4em1v3DimLFLEiMOA7Zlnr5XNowth1K1qhMF7gKiEP/XiObuQKL+MVTlDbTr
 ovqa2+2epOh/DIK+2104M6LVjLe3Sur1OdCAuiv72JhfdfHqf4vKNdnxpJb6Ne++Z4Chv0gvZPBf
 YKNwm1+xh8I9mO9VckOUYwrYBw9dol/c6AIMsP7gRAoJAsTEiUxPttpFv1QEGZahgSIheROKCHEV
 dbl7kbYidkA8gg0lvKF7WmvTsnsJX7APcpJUTPP88TlItVyclRdoOnuy8nNqzQBDL50dD+Lv2hzj
 rjcA/g/ZikILwca0zTXsrZoCsLDiNAtKmPCNllcc7plFyIJneeczG/aG5ql7MEqM+RCWTl66xqQ/
 dvEluiKsFwhI9pS+LGURWJhRVCIJA3FAgiTiALJMm7ciDp2NUbIegWJo2OvuzClB5XdhjTbsFBAy
 ThrPQGa1RMVFDg5KjNvuIn84rzeDYAz3gZB56bG+lMZdxkuZ2hZ/8YyaFkiHWSJKmH1q3/dlFJIy
 AgpSvabryQ12+Bf9QF+COYu+d0uoGc/NNrQnyYOa441j3cOqW5zbLcxBgko64lgu3q8w7X6osuIv
 /r45qkG8d7RAvaIr1JSsdxEnVZecMmb4URSZM4A8nHqYWdz7BdRPaKL6ILs9YuBwzsZ+thFB4uiZ
 a2jQ/G+uH73hvo++OR4Eh86GfleNbiYBDTPYd+O17azxkFkLIEHxj4oF9+XESU5NLGh14r/7xVZy
 8Ps1mJ0tn32SINEdEhVlyMtl6btS7casr1CoYrXwX2BHgovHfourZqD9zD7wibWg0yjQ1jsvOvnH
 SAMByaP4ZDlyXzXqy8
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: Rong Tao <rtoax@foxmail.com>
To: rtoax@foxmail.com
Date: Sat,  2 Sep 2023 13:24:38 +0800
X-OQ-MSGID: <20230902052438.139708-1-rtoax@foxmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <tencent_4F0CF08592B31A2E69546C5E174785109F09@qq.com>
References: <tencent_4F0CF08592B31A2E69546C5E174785109F09@qq.com>
MIME-Version: 1.0
Cc: yonghong.song@linux.dev, ast@kernel.org, song@kernel.org,
 laoar.shao@gmail.com, rongtao@cestc.cn, linux-kselftest@vger.kernel.org,
 shuah@kernel.org, linux-stm32@st-md-mailman.stormreply.com, mykolal@fb.com,
 daniel@iogearbox.net, john.fastabend@gmail.com, andrii@kernel.org,
 jolsa@kernel.org, kpsingh@kernel.org, olsajiri@gmail.com,
 linux-arm-kernel@lists.infradead.org, haoluo@google.com,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, bpf@vger.kernel.org,
 martin.lau@linux.dev, sdf@google.com
Subject: Re: [Linux-stm32] [PATCH bpf-next v10 0/2] selftests/bpf: Optimize
	kallsyms cache
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

Hi, every one.

I'm so sorry, that i'm not familier with 'how to submit patch series',
I just sent some emails repeatedly using the git send-email command,
please ignore the error messages.

PS: How to send patch collections using git send-email?

Rong Tao

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
