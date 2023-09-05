Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B8C793562
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Sep 2023 08:32:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A77C1C6C82B;
	Wed,  6 Sep 2023 06:32:01 +0000 (UTC)
Received: from out203-205-251-80.mail.qq.com (out203-205-251-80.mail.qq.com
 [203.205.251.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D008C6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Sep 2023 14:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1693923725;
 bh=HENdTPz9DKLgwbLK0xXsSzaRwMyikMlHnYMJdwmq++0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=H7EaYOp5egAJsKwnA8munvzl9JiKOzBwhRK8/WJHf+uurhgJdAZG47SHzkELlCTwB
 JpP1Bod9ZPJf86/SDiJmNYzwwJItNk42oS6MIi5iDp75H9VGP5PjFfAUEK3rlxiIL5
 9TvPGp4gqOwNdpfCQmzOm/DznxiW/b1PqcSNW/jc=
Received: from rtoax.lan ([120.245.114.157])
 by newxmesmtplogicsvrszb1-0.qq.com (NewEsmtp) with SMTP
 id 580046EB; Tue, 05 Sep 2023 22:22:00 +0800
X-QQ-mid: xmsmtpt1693923720t1sy3uo3k
Message-ID: <tencent_2D10CB0CD885A8B2A42EAB546E5EEF467B09@qq.com>
X-QQ-XMAILINFO: NY3HYYTs4gYS5ZQPGHX+/hR4HEKI2ljXem8GivFomlSl2eDzLj1NiT397Jr5pD
 8nI9TJ9PMGRcMnU/o/lcNJwmB8eE3spPvl53RKPPydsXy2XxmhL5Xbo6b3tyLa3tm6GB0twTnT1k
 XnCeFIYs5MvEvK9rP3UvLqdIy4EBciqWWabXZNCrwQ6M68HyrKvBPzaNSX5ChOyk55iPAKs/MZgH
 NdLJbxm7G9auXiRPutnh5FyX2qJYWYWwxOqZUZfMIMMS1M0W6sJV30RAevtPiC+EYnI5RQ8N7pDq
 dlNsmW4rJNQwYL8cWyPLLXaslEbu51mntl4vGEXxiSidInFK8RUo1+7zEM/k3qSq2owg5iOTcleO
 kNDEqHXtSn6aUB3rpWUTslfqXNCPnZv3zkNaeY5UDXdK7jf3bW3un6ApZnVs+j6BqCX+T4SbiLWF
 wKfoTpO5FXTHQUqByPMnE6Lcq9ELoZyK1PK+LP6ZOPRdnI4CUtF7CufpFUGpxW+0JtsdmYWt1UOa
 Ptdj9W33+EJ9qtwDOy3D0ifyoQBuzhTgm56Fwe7glclWed0OyGYfYaIGWdVe8KBLhgYMWRWBB5I7
 eZQ3bWBqlIpkdmMA8Nz+OwHoNV4+J/vej98+WtOV8C8RYfzrwOaLMf5xEqmf83gpWV4vJ9LCJs4W
 OuMcEzmX/3JOzG/VHst7kryEPYYG8d6IKSMPDwzJnhyAL68Z4HBYRTKiL47KSA7GKR52DAaQuc7m
 DbTMchSTmwiU7lPjevb7ZUMD4iTYgbneF99Xz/ujZWLreCzVNqvURl6lRSB94n3/cFaTcTEIBboc
 PvOOIhw/pDwjQkw+3M3JmAvxIiIIQDvkGLJreVYhIcqJBHtHqIe/8ebzngGeivwt0B1kPhhygoUH
 lnav8x5/yOs8CfwhhkTRbXm6RdrFBE/ES5gUmRhGlq7aBmlOHExNAGcoUOf1TFpLaCLuKxSowxu8
 3kYG7KvR6ysnbGGiGoohMCNtb+DV16G0GJuaUybFE0xUPATzDfsiDAk83DnYqmp/yhq3e4jsyoV/
 mByZ4qvFfYoRjGczcwKdFEysvUroc=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Rong Tao <rtoax@foxmail.com>
To: olsajiri@gmail.com
Date: Tue,  5 Sep 2023 22:21:59 +0800
X-OQ-MSGID: <20230905142159.114458-1-rtoax@foxmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <ZPY1Lu8341L+d5Rw@krava>
References: <ZPY1Lu8341L+d5Rw@krava>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 06 Sep 2023 06:32:00 +0000
Cc: linux-kselftest@vger.kernel.org, ast@kernel.org, song@kernel.org,
 laoar.shao@gmail.com, rongtao@cestc.cn, yonghong.song@linux.dev,
 rtoax@foxmail.com, shuah@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 mykolal@fb.com, daniel@iogearbox.net, john.fastabend@gmail.com,
 andrii@kernel.org, kpsingh@kernel.org, linux-arm-kernel@lists.infradead.org,
 haoluo@google.com, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 bpf@vger.kernel.org, martin.lau@linux.dev, sdf@google.com
Subject: Re: [Linux-stm32] [PATCH bpf-next v10 1/2] selftests/bpf:
	trace_helpers.c: optimize kallsyms cache
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

Hi, jirka.

I just fix all your advise[0], and submit new patchset v11.
please review.

Rong Tao

[0] https://lore.kernel.org/lkml/ZPY1Lu8341L+d5Rw@krava/

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
