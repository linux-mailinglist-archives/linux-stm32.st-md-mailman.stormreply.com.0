Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E8D294008
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Oct 2020 17:57:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B02FAC424B9;
	Tue, 20 Oct 2020 15:57:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1454AC424B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Oct 2020 15:57:31 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09KFfsqH008231; Tue, 20 Oct 2020 17:57:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=vxVcS0wL2dmaUGtZbYgULMDICAzdzq2c+2XOgarz2W8=;
 b=tSwotTfTGzp0UfKKaB1HYz9zhyFIEMvXk0/ssAnHzRK+LOHI19fiimx69WyRWlMICUAy
 Wo/P3c1f+2gcH1cH8RY4Q/DQXDqInf17gTxzmFToN4alTF2f9oVsf8NHy8EVb9f3apvz
 rWEAn3mKh4y/ZWU2sGc4CRv4h/9xJkO58xI0wfaCRBhBvimJlhhY8B5KF0p+kE9ISYR9
 IXIsI+hxUy1hX0QuNS7/dnnSJqYNz5LpoxAZoys1cKVQLHSPFO044Ol6n+Pk8tfK+2NC
 x2ULDjdMqr5yEYnbJ2xw+KEATp0kc3Eq0cMKnu8yHxLVxWAGItQlU51t1T3pdBOakj0b YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347pcwuuw8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Oct 2020 17:57:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3188410002A;
 Tue, 20 Oct 2020 17:57:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BD477206290;
 Tue, 20 Oct 2020 17:57:13 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct 2020 17:57:13
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alexandre.torgue@st.com>, <robh@kernel.org>,
 <mark.rutland@arm.com>, <olivier.moysan@st.com>
Date: Tue, 20 Oct 2020 17:57:07 +0200
Message-ID: <20201020155709.2621-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-20_08:2020-10-20,
 2020-10-20 signatures=0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/2] dt-bindings: stm32: convert audio
	dfsdm to json-schema
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

Some audio properties documented in st,stm32-adfsdm.txt are already documented
in Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml bindings.
Move remaining properties from st,stm32-adfsdm.txt to st,stm32-dfsdm-adc.yaml,
and remove st,stm32-adfsdm.txt.

Changes in v2:
- Complete st,stm32-dfsdm-adc.yaml rather than converting st,stm32-adfsdm.txt

Olivier Moysan (2):
  dt-bindings: stm32: dfsdm: update audio properties
  dt-bindings: stm32: dfsdm: remove stm32-adfsdm.txt binding

 .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml  |  7 ++-
 .../bindings/sound/st,stm32-adfsdm.txt        | 63 -------------------
 2 files changed, 5 insertions(+), 65 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-adfsdm.txt

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
