Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3148D9858AD
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Sep 2024 13:46:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7B49C78006;
	Wed, 25 Sep 2024 11:46:06 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF128C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 11:45:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A15325C5820;
 Wed, 25 Sep 2024 11:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64329C4CEC3;
 Wed, 25 Sep 2024 11:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727264758;
 bh=k9RDrPj+Z2firOORPKM9HyK8UpTlqYHTGGRiT3jYDFg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ly7QgBXT28jlqT/UK+RDgO6Jt/ynuKX1WOPRdgAiNWr6oh0eFEGPa0rivNZAEYUvV
 a1xcXZ2l3iaI2zCAkYcednxTtdIQya9+oJ1hXWjG68A11kLDNyveHW8ueRymGkfGLB
 lzS685/WkeJPaKzrchyDT/QQ6vdqoEAl2LNfxLKMsLI44BJ9pe38LVkFlhEPidpF4s
 7zCktnKur101Z84fZaehXVSY6Ys0x3k/kA/Ud49JJbGsZFPSuYIurAejENGwJnecp2
 yoXiwiztE+8VgkUmubKlbUaHf/TNxkeh2PXTicJEZ39h8JsotMvTezyRUEcoQFbu5v
 0CXPFzM+7ojdQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 25 Sep 2024 07:26:08 -0400
Message-ID: <20240925113641.1297102-147-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
Cc: davemarchevsky@fb.com, Peter Zijlstra <peterz@infradead.org>,
 ast@kernel.org, jrife@google.com, linux-kselftest@vger.kernel.org,
 thinker.li@gmail.com, shuah@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Sasha Levin <sashal@kernel.org>,
 daniel@iogearbox.net, geliang@kernel.org, andrii@kernel.org,
 martin.lau@kernel.org, dxu@dxuuu.xyz, Jiri Olsa <olsajiri@gmail.com>,
 linux-arm-kernel@lists.infradead.org, bentiss@kernel.org,
 Oleg Nesterov <oleg@redhat.com>, eddyz87@gmail.com, mcoquelin.stm32@gmail.com,
 bpf@vger.kernel.org, alan.maguire@oracle.com
Subject: [Linux-stm32] [PATCH AUTOSEL 6.11 147/244] selftests/bpf: fix
	uprobe.path leak in bpf_testmod
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

From: Jiri Olsa <olsajiri@gmail.com>

[ Upstream commit db61e6a4eee5a7884b2cafeaf407895f253bbaa7 ]

testmod_unregister_uprobe() forgets to path_put(&uprobe.path).

Signed-off-by: Jiri Olsa <olsajiri@gmail.com>
Signed-off-by: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://lore.kernel.org/r/20240801132724.GA8791@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c b/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c
index fd28c1157bd3d..72f565af4f829 100644
--- a/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c
+++ b/tools/testing/selftests/bpf/bpf_testmod/bpf_testmod.c
@@ -477,6 +477,7 @@ static void testmod_unregister_uprobe(void)
 	if (uprobe.offset) {
 		uprobe_unregister(d_real_inode(uprobe.path.dentry),
 				  uprobe.offset, &uprobe.consumer);
+		path_put(&uprobe.path);
 		uprobe.offset = 0;
 	}
 
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
