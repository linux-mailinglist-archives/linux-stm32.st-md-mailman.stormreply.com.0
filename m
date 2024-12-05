Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9618F9E67B1
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Dec 2024 08:15:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B847C6DD9A;
	Fri,  6 Dec 2024 07:15:44 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FF02C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2024 15:32:30 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-29e3721ded9so699014fac.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Dec 2024 07:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cornersoftsolutions.com; s=google; t=1733412749; x=1734017549;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=mSVWv3kzGyP7Ixr3DcJKWQ/Cs0NKKVxGUdtaJxvtNOU=;
 b=CA5o1atH2rmtZa3nVDoFinidFTIzjYFXt2l9HYwfJyZFc3mi566naDhGExJcE/5X2z
 dXxpcwTuywo0GKOAY/Vt0CdfyYyBxYVx6BY19NpeKi3ml6qs1cqhU86wxvwsrDpe+XZI
 bYDhdp1I3GVOJNQAtV7pbjXorVl8i/VPodE6IPe1iZnK13GsZ/nybt44nAtviTO4QyJd
 h1b0MMv9pUvRXxy0r7xRSrBPUVQ6EbzPzy9bW3gEEXeU/IzplhH9Gsx33mBHscyZ/rmn
 8hUtPkPj9FI8rfQX0T/x29lkwN7TvXbX8t4fgz2lEp+8Z77rx9jP122xspO19PShkuIL
 ISug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733412749; x=1734017549;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mSVWv3kzGyP7Ixr3DcJKWQ/Cs0NKKVxGUdtaJxvtNOU=;
 b=TWcm9epQSeWPNfp5kjKSWZmaHHuMSPoLhAkGeYtBmt7uggrpLnUi2QaJHjF6oNICmH
 UOmUTEYRuVp2wHannfruXV4LRHdlsMpIIDC1eKrjedLKEmUJMLujfnI5igw0w9pcFhd9
 vsaseZ2w6C6JnW2G9m5zqzz2zExpD4caHdlefUOLVQhk9jezadVi1PNCTMXgqRuX0WK7
 Ei25DDKMkjI33yU708Jj9eMhdzZr6IWxqpLLpqFLLEYOWCBiqwbWDmUlQczswakjK0iW
 H740kXs0E6IvpIsloTOyCD3G9FYeMEaxwr0G1nzp2e8X0XiIRUouN/1E/OO78VnLZQQ4
 v/ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvh00yRQ6GdGu+DSaahEnlyuqIoAWHXoHo3OBCShjlPDu8AlgwB1koEHVCRpNPFvDvc9X6CIaJokSRAg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyf+QcQKDWeI/dOCQHHYThv8eLgE7l0HLHfpCWLLlbnZo8PpXWy
 nO3jPXDg95JTKPJdRUh/+h9arMrcaeLI7BBC6RBns5JdYNfgU+yiQJSltf5ILT0FzEZgIvSMsAy
 u99oPZ/uBCje+zKe4Y8HvUW6BBnkexJDMzspw1Q==
X-Gm-Gg: ASbGncvXB+ZNhLJr+/oRuVnUuOSTDtW1onKWtrGQVjGKLM7wJRu+PBpIDxSGzKz1E5r
 2TNLGkczpYjbHUccir3PkYjLrx5i0hUnO
X-Google-Smtp-Source: AGHT+IEXh3wkarBLzAyKqYC0kT/Y8r28C1neLlKp6rQpRD5NvnZVxaGgz+SOmihpuXwnZlzhFMNga5hrHKjeRZiwzUg=
X-Received: by 2002:a05:6871:606:b0:296:ee2e:a23c with SMTP id
 586e51a60fabf-29e88560c9bmr11677702fac.5.1733412749132; Thu, 05 Dec 2024
 07:32:29 -0800 (PST)
MIME-Version: 1.0
From: Ken Sloat <ksloat@cornersoftsolutions.com>
Date: Thu, 5 Dec 2024 10:32:17 -0500
Message-ID: <CADRqkYAaCYvo3ybGdKO1F_y9jFEcwTBxZzRN-Av-adq_4fVu6g@mail.gmail.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 dmaengine@vger.kernel.org, alexandre.torgue@foss.st.com, 
 mcoquelin.stm32@gmail.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org, vkoul@kernel.org, amelie.delaunay@foss.st.com
X-Mailman-Approved-At: Fri, 06 Dec 2024 07:15:43 +0000
Cc: Ken Sloat <ksloat@cornersoftsolutions.com>
Subject: [Linux-stm32] [PATCH v1] dt-bindings: dma: st-stm32-dmamux: Add
 description for dma-cell values
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

The dma-cell values for the stm32-dmamux are used to craft the DMA spec
for the actual controller. These values are currently undocumented
leaving the user to reverse engineer the driver in order to determine
their meaning. Add a basic description, while avoiding duplicating
information by pointing the user to the associated DMA docs that
describe the fields in depth.

Signed-off-by: Ken Sloat <ksloat@cornersoftsolutions.com>
---
.../bindings/dma/stm32/st,stm32-dmamux.yaml | 11 +++++++++++
1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml
b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml
index f26c914a3a9a..aa2e52027ee6 100644
--- a/Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml
+++ b/Documentation/devicetree/bindings/dma/stm32/st,stm32-dmamux.yaml
@@ -15,6 +15,17 @@ allOf:
properties:
"#dma-cells":
const: 3
+ description: |
+ Should be set to <3> with each cell representing the following:
+ 1. The mux input number/line for the request
+ 2. Bitfield representing DMA channel configuration that is passed
+ to the real DMA controller
+ 3. Bitfield representing device dependent DMA features passed to
+ the real DMA controller
+
+ For bitfield definitions of cells 2 and 3, see the associated
+ bindings doc for the actual DMA controller the mux is connected
+ to.
compatible:
const: st,stm32h7-dmamux
-- 
2.34.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
