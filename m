Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA57A857931
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Feb 2024 10:49:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86A99C6C83D;
	Fri, 16 Feb 2024 09:49:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 703C9C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Feb 2024 09:49:29 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41G4qrbW018706; Fri, 16 Feb 2024 10:49:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=CQbKI3q6/SH3YpK3aFqJIfLPoWvnVZQLDfz/UiKph8I=; b=Nx
 zL8TLZiZUowQPsg3IhFKrjHe1qZJ+qJYCC4fd+uGeJ6aJX901VAQF0X/cpMqxL6Q
 qZFhVP5PZmjzzH8pjq6E9Fr3f/HEgTMASYPMuHEuGpSODs7EUOeDOarVuxnj9Tvy
 Bmsj1oQ6aEuZipkkUwhWku8BIQAJswMo0gO3DIimuzvj0fuBg6SdHiRcYwmY471J
 GaqMawXT8gVUZhP3kMWCpkED8l4Qz7WYIJniWONeyPYT6O1EMO5EOH6krZ+uRkVG
 uod9dQ4yAQO1E0mxE6C5dqFEX9UFzWK8VZnmvPfeQ8mgu593EuU8qJMfyVfHo+NH
 LKCeXX8ESOt1z1FrC5QQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wa12ary49-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Feb 2024 10:49:06 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 60E6040047;
 Fri, 16 Feb 2024 10:49:03 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D1539237D79;
 Fri, 16 Feb 2024 10:48:18 +0100 (CET)
Received: from localhost (10.201.20.114) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 16 Feb
 2024 10:48:18 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Date: Fri, 16 Feb 2024 10:47:48 +0100
Message-ID: <20240216094758.916722-4-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216094758.916722-1-antonio.borneo@foss.st.com>
References: <20240216094758.916722-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.114]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_08,2024-02-14_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 03/12] irqchip/stm32-exti: Map interrupts
	through interrupt nexus node
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

The mapping of EXTI interrupts to its parent interrupt controller
is both SoC and instance dependent.
The current implementation requires adding a new table to the
driver's code and a new compatible for each new EXTI instance.

Check for the presence of the optional interrupt nexus child node
and use its property 'interrup-map' to map EXTI interrupts to the
parent's interrupts.

For old DT's without the optional nexus child node, the driver's
behavior is unchanged, thus keeps backward compatibility.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 drivers/irqchip/irq-stm32-exti.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index 69982f21126a..95bb3dd10b2c 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -61,6 +61,7 @@ struct stm32_exti_host_data {
 	struct stm32_exti_chip_data *chips_data;
 	const struct stm32_exti_drv_data *drv_data;
 	struct hwspinlock *hwlock;
+	struct device_node *irq_map_node;
 };
 
 static struct stm32_exti_host_data *stm32_host_data;
@@ -713,8 +714,9 @@ static int stm32_exti_h_domain_alloc(struct irq_domain *dm,
 	u8 desc_irq;
 	struct irq_fwspec *fwspec = data;
 	struct irq_fwspec p_fwspec;
+	struct of_phandle_args out_irq;
 	irq_hw_number_t hwirq;
-	int bank;
+	int bank, ret;
 	u32 event_trg;
 	struct irq_chip *chip;
 
@@ -731,6 +733,25 @@ static int stm32_exti_h_domain_alloc(struct irq_domain *dm,
 
 	irq_domain_set_hwirq_and_chip(dm, virq, hwirq, chip, chip_data);
 
+	if (host_data->irq_map_node) {
+		out_irq.np = host_data->irq_map_node;
+		out_irq.args_count = 2;
+		out_irq.args[0] = fwspec->param[0];
+		out_irq.args[1] = fwspec->param[1];
+
+		ret = of_irq_parse_raw(NULL, &out_irq);
+		if (ret)
+			return ret;
+		/* we only support one parent, so far */
+		if (of_node_to_fwnode(out_irq.np) != dm->parent->fwnode)
+			return -EINVAL;
+
+		of_phandle_args_to_fwspec(out_irq.np, out_irq.args,
+					  out_irq.args_count, &p_fwspec);
+
+		return irq_domain_alloc_irqs_parent(dm, virq, 1, &p_fwspec);
+	}
+
 	if (!host_data->drv_data->desc_irqs)
 		return -EINVAL;
 
@@ -908,7 +929,7 @@ static int stm32_exti_probe(struct platform_device *pdev)
 {
 	int ret, i;
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
+	struct device_node *child, *np = dev->of_node;
 	struct irq_domain *parent_domain, *domain;
 	struct stm32_exti_host_data *host_data;
 	const struct stm32_exti_drv_data *drv_data;
@@ -976,6 +997,10 @@ static int stm32_exti_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	child = of_get_child_by_name(np, "exti-interrupt-map");
+	if (child && of_property_read_bool(child, "interrupt-map"))
+		host_data->irq_map_node = child;
+
 	stm32_exti_h_syscore_init(host_data);
 
 	return 0;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
