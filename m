Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C64FCC17AB
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Dec 2025 09:10:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D312AC87EDF;
	Tue, 16 Dec 2025 08:10:23 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E624C35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 14:30:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C0D7843D11;
 Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A222C4CEFB;
 Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765809005;
 bh=AwEDboNk5GmPqrs+ygIr6oF3UxdqLcCX4eLfPid2KXw=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=eFnn5rK5ZJjeC1GTOsEbqEYZXSPAtLC0k+0D/HS9BqcX1hlOTZbnx7sI4XYrgQSuE
 2Iehherh73rkKYUZt4iEMaQEJIdy3qtNBqZNfcUYov9EIFdIbl8roLERrJx9e1ao6d
 nu9Ktfu6077v8ejNFSHspvsctRrDO/lE/RXCNJMqf0aeU0GA27PjCrLasW63uAm7n7
 tKxL+4zMxEtSeY7Tcka3zwVnpCHY+CD6BRg2rwOfrkdyBI7DizBcWRMtu6G+MZAEW2
 t4fzp5qnp75/gclDvKK0fqhc4QZ/On67N2zCvAYSH754M2fISCnba/M7M3FyoEuq/m
 lTJw4kZ2pxR5g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5FAD5B16F;
 Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 15 Dec 2025 15:30:00 +0100
Message-Id: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGgbQGkC/x2KOwqAMAxAr1IyG7ApDvUq4iA21SxVGhGheHeD4
 /s0UK7CCqNrUPkWlaMY+M7Bui9lY5RkDNTT4MkT5ksxy8OKwVTIiSOlCPaflf9g+zS/7wfDWL/
 wWwAAAA==
X-Change-ID: 20251212-fts-fixes-30253fde92d9
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Petr Hodina <petr.hodina@protonmail.com>, 
 Javier Martinez Canillas <javier@osg.samsung.com>, 
 Rob Herring <robh@kernel.org>, Andi Shyti <andi@etezian.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=687; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=AwEDboNk5GmPqrs+ygIr6oF3UxdqLcCX4eLfPid2KXw=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpQBtraKyNehUYf6Zq6STWquVGzPauk3f3hyPmo
 SDg/syWgFuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUAbawAKCRBgAj/E00kg
 cnymD/4+NtvqTd1F7d46ZcugHEDVrc8ViX33x3uIbtImJbzqS1A+MAec4i6/CM31tn4plgGWqWy
 6EypuPlpKe3sXz0yXKC6JeGjQA9mQiuKldrE1AyJSOI2wN+YlY+j1mjfwSETttukIHytCTV0nbf
 irO7tc+AFrOzqBS84eAj9ndDdQp7LCXjSBznGgnCLJKzREM00nrKhlZMxgI7sFbDD3yTjXNPce1
 M+XR7AYGoHD5B6hNRAUDEbXY/7+BFRCkvgEozGB+A4uc7yqaPDU1ILb56vfj1IavErElxFWq4pt
 j73h/x7YHjrM3RsZAjAMaEpAHp162W5xOCfYzVmcW0Ldch+Cd+3pxGYsFayjfqq7V1AukSQy94n
 1wgsvafywp/tx8HPPNQf/GWLhhOhUFzJR9s3pA0HQrDcZte6mAI+m1mw3GMg4mAyR3Y0rkZHqv0
 prczUCdbQbTjBsGu+bhigFIMlCnwBm96sYKm8Dipxnfro++8FCv/RWfuj2CUOa0kJuwylkmT9RG
 HOlLXX8pcQdXOpZPwa8vGZoZvZcox/6BETTxeCARd9R1txymFGXBY0dPXvcZ8q6KF/0pwKwHKWE
 uy8fNM5yr9XrYOCMLDOznJL8huvL/ZiRudqnhXqaVPIdmDyIf5iCm14FRfejA/MSEwKg7FKEL2h
 sVYg2BC42MPHhNw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-Mailman-Approved-At: Tue, 16 Dec 2025 08:10:20 +0000
Cc: linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/4] Input: small nitpick fixes
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
Reply-To: david@ixit.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Feel free to ignore the last patch, if you want to wait for FTS5
support.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (1):
      Input: stmfts - correct wording for the warning message

Petr Hodina (3):
      Input: stmfts - Make comments correct
      Input: stmfts - use sysfs_emit() instead of sprintf()
      Input: stmfts - use client to make future code cleaner

 drivers/input/touchscreen/stmfts.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)
---
base-commit: 4a5663c04bb679631985a15efab774da58c37815
change-id: 20251212-fts-fixes-30253fde92d9

Best regards,
-- 
David Heidelberg <david@ixit.cz>


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
