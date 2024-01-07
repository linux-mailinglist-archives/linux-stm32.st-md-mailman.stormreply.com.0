Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F5D826668
	for <lists+linux-stm32@lfdr.de>; Sun,  7 Jan 2024 23:40:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6880AC6B476;
	Sun,  7 Jan 2024 22:40:40 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CDBEC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  7 Jan 2024 22:40:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8A458CE0E42;
 Sun,  7 Jan 2024 22:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B02C433C7;
 Sun,  7 Jan 2024 22:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704667235;
 bh=gMeYwznrjbIU8oGXfP+WnPDxDzH5U/iZaLqQJDBkChs=;
 h=From:Date:Subject:To:List-Id:Cc:From;
 b=Ch+/YL1VL+p4NtQnARIOOvL4qWL68Ui0QhykfB4b/pOBtjQKZozTQkoGQQyMv+v+z
 OX0jtC9KynReOz1mP1Zwvzj9sHFOqvxAzhfU6J+oKdR0YP+3YM7UrvjbnZqVQ3Uobb
 mPi8FeOYKqMJ9RCY9m5BLt5WKh8M5nxdP7qeM+xzl8/Dfzjcn1dDXOaMqScZhwL+Rq
 bw7fayEX2Zlpb3pn+0EAseAYmbxjpCdlI6DcL2xndgxnGmvh32HnkXiA5ZH9BbTWi6
 KTpP3oXOisn5a2r2HWDc9hrvC0gkuGUhk906yzxjWLords+GAit3PHEY+MkbZKebwN
 YYIkeuMioaTGg==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 07 Jan 2024 22:40:29 +0000
MIME-Version: 1.0
Message-Id: <20240107-arm-defconfig-stm32-ipcc-v1-1-924721db5661@kernel.org>
X-B4-Tracking: v=1; b=H4sIAFwom2UC/x3MMQrDMAxA0asEzRXIboggVykdjCwnGmwHu5RCy
 N1rMr7h/xO6NtMO63RC0691q2XAPSaQPZRN0eIwePIzOWIMLWPUJLUk27B/8tOjHSK4zETshEN
 khpEfTZP97vXrfV1/dKzoIGoAAAA=
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=924; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gMeYwznrjbIU8oGXfP+WnPDxDzH5U/iZaLqQJDBkChs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlmyhg2lXCL3MIQsuRcxZL6PRQTJ7KfgTBogFnh
 kEGv+36+OaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZZsoYAAKCRAk1otyXVSH
 0NjRB/4r9gayJx9sLsDkrCbccgsHwsdKSDyE5usVSohEHTWmpBpP/xjYkadUXQydpUw6NnJVofa
 Wzpv1APyGBl3kcdHZ0wBtQT8+LUDnaLek7FPGhVzEBAjpWwotHbpOF0hP9JcPiEAKpNeO7ytTvb
 Az6HYTN830yfs+Uf+tZUJOdkUjEeSeObsl2yaOx3810jVLC1mEN9o1CxsGh6j5JaoUGIVqR4uIb
 kjVOi+0O0BY7oYRnLdLWZLnSXsWSoBJ14/O9uxPniT3Xhm5k756YuyvUVAo8yCKXAw3GY+2LMgE
 htQUGy6rTPa9cVobOQW8wTKh2r3GpGSGiGW591lPXMQB9VTC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Cc: soc@kernel.org, Mark Brown <broonie@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] ARM: multi_v7_defconfig: Enable STM32 IPCC
	mailbox driver
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

The STM32 systems have a mailbox used for communication with non-Linux
processors like the M4 on the STM32MP157A.  Enable the driver for the
mailbox so it is available for testing.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 10fd74bf85f9..f43ae4532586 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1073,6 +1073,7 @@ CONFIG_OMAP2PLUS_MBOX=y
 CONFIG_BCM2835_MBOX=y
 CONFIG_QCOM_APCS_IPC=y
 CONFIG_QCOM_IPCC=y
+CONFIG_STM32_IPCC=m
 CONFIG_OMAP_IOMMU=y
 CONFIG_OMAP_IOMMU_DEBUG=y
 CONFIG_ROCKCHIP_IOMMU=y

---
base-commit: 610a9b8f49fbcf1100716370d3b5f6f884a2835a
change-id: 20240107-arm-defconfig-stm32-ipcc-640071c7ad77

Best regards,
-- 
Mark Brown <broonie@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
